//
//  SecondView.swift
//  MVVM Network Test Project
//
//  Created by Fadey Notchenko on 05.02.2022.
//

import SwiftUI

struct SecondView: View {
    
    let data: Model
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: data.image)!) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 300, height: 300)
            
            Text("\(data.name)")
                .bold()
            
            Spacer()
        }
    }
}
