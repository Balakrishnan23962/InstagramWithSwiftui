//
//  SearchViewModel.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 24/05/23.
//

import Foundation
import Combine

class SearchViewModel : ObservableObject {
    
    @Published var users = [User]()
    @Published var isLoading : Bool = false
    @Published var cancellables = Set<AnyCancellable>()
    
    init() {
        Task{
            try await fetchUsers()
        }
    }
    
    @MainActor
    func fetchUsers() async throws {
            isLoading = true
           let user =  try await userService.fetchAllUsers()
            switch user {
            case .success(let success):
                isLoading = false
                self.users = success
            case .failure(let failure):
                print("\(failure.localizedDescription)")
            }
    }
}
