//
//  University.swift
//  MVVM Network Test Project
//
//  Created by Fadey Notchenko on 31.01.2022.
//

import Foundation

struct ServiceResult: Codable {
    let results: [Model]
}

struct Model: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
