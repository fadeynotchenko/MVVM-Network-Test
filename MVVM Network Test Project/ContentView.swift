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
                        VStack {
                            Text("\(item.name)")
                        }
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
