//
//  SignUpFlowViewModel.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 17/05/23.
//

import Foundation


enum SignUpEnum {
    case email
    case userName
    case password
}


class SignUpFlowViewModel : ObservableObject {
    
    @Published var signUpEnum : SignUpEnum = .email
    @Published var email = ""
    @Published var password = ""
    @Published var userName = ""
    
    init() {}
    
    
    var signUpFlow : [SignUpFlow] = [
    
        SignUpFlow(title: "Add your Email", description: "You will use this email to sign in to your account",textFieldInput: "Email"),
        SignUpFlow(title: "Create Username ", description: "Pick a username for your new account. You can always change it later",textFieldInput: "Username"),
        SignUpFlow(title: "Create a password", description: "Your password atleast 6 characters in length",textFieldInput: "Password"),
        SignUpFlow(title: "Welcome to Instagram", description: "Click below to complete registration and start using instagram")
    ]
    
}
