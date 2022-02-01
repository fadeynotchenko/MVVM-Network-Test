//
//  ContentView.swift
//  MVVM Network Test Project
//
//  Created by Fadey Notchenko on 31.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel(service: Service())
    
    var body: some View {
        
        NavigationView {
            
            switch viewModel.state {
                
            case .success(let data):
                List {
                    ForEach(data, id: \.id) { item in
                        HStack {
                            AsyncImage(url: URL(string: item.image), scale: 2.0) { image in
                                image
                            } placeholder: {
                                Image(systemName: "photo")
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                    .clipped()
                            }
                            Text("\(item.name)")
                        }
                        .padding()
                        
                    }
                }
                .navigationTitle("Characters")
                
            case .loading:
                ProgressView()
                
            default:
                EmptyView()
            }
            
        }.task {
            await viewModel.getUniversity()
        }
        .alert("Erorr", isPresented: $viewModel.hasErrors, presenting: viewModel.state) { detail in
            
            Button("Retry") {
                Task {
                    await viewModel.getUniversity()
                }
            }
            
        } message: { detail in
            if case let .failed(error) = detail {
                Text(error.localizedDescription)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
