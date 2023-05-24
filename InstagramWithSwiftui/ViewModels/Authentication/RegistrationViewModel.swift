//
//  RegistrationViewModel.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 23/05/23.
//

import Foundation


class RegistrationViewModel : ObservableObject {
    @Published var userName = ""
    @Published var email = ""
    @Published var password = ""
}


extension RegistrationViewModel {
    
    func createUser() async throws {
        
      try await AuthService.shared.createUser(email: email, password: password, userName: userName)
        
    }
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
    
}
