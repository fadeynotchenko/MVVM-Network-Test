//
//  UniversityService.swift
//  MVVM Network Test Project
//
//  Created by Fadey Notchenko on 31.01.2022.
//

import Foundation

struct Service {
    
    enum ServiceError: Error {
        case failed
        case failedDecode
        case invalidStatusCode
    }
    
    func fetchData() async throws -> [Model] {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let config = URLSessionConfiguration.ephemeral
        let (data, response) = try await URLSession(configuration: config).data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
                  throw ServiceError.invalidStatusCode
              }
        
        let decodedData = try JSONDecoder().decode(ServiceResult.self, from: data)
        return decodedData.results
    }
}
