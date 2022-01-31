//
//  UniversityService.swift
//  MVVM Network Test Project
//
//  Created by Fadey Notchenko on 31.01.2022.
//

import Foundation

struct UniversityService {
    
    enum UniversityServiceError: Error {
        case failed
        case failedDecode
        case invalidStatusCode
    }
    
    func fetchUniversity() async throws -> [University] {
        let url = URL(string: "http://universities.hipolabs.com/search?country=United+States")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
                  throw UniversityServiceError.invalidStatusCode
              }
        
        let decodedData = try JSONDecoder().decode(UniversityServiceResult.self, from: data)
        return decodedData.results
    }
}
