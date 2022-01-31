//
//  University.swift
//  MVVM Network Test Project
//
//  Created by Fadey Notchenko on 31.01.2022.
//

struct UniversityServiceResult: Codable {
    let results: [University]
    
}

struct University: Codable {
    let id: Int
    let name: String
}
