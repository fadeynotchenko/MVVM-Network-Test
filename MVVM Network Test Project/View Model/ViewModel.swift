//
//  UniversityViewModel.swift
//  MVVM Network Test Project
//
//  Created by Fadey Notchenko on 01.02.2022.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    
    enum State {
        case na
        case loading
        case success(data: [Model])
        case failed(error: Error)
    }
    
    private let service: Service
    
    init(service: Service) {
        self.service = service
    }
    
    @Published private(set) var state: State = .na
    @Published var hasErrors: Bool = false
    
    func getData() async {
        self.state = .loading
        
        do {
            let data = try await service.fetchData()
            self.state = .success(data: data)
        } catch {
            self.state = .failed(error: error)
            self.hasErrors = true
        }
    }
}
