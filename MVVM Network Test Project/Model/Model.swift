//
//  University.swift
//  MVVM Network Test Project
//
//  Created by Fadey Notchenko on 31.01.2022.
//

struct ServiceResult: Codable {
    let results: [Model]
    
}

struct Model: Codable {
    let id: Int
    let name: String
    let status: String
}
