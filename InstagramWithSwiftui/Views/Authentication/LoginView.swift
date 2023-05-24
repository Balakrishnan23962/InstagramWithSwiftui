//
//  LoginView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 16/05/23.
//

import SwiftUI

struct LoginView: View {
    @State var currentPage = 0
    @StateObject var viewModel = RegistrationViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("insta_logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    
                Group {
                    TextField("Enter your email", text: $viewModel.email)
                        .textInputAutocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                }
                .modifier(IGTextFieldModifier())
                
                Button {
                    
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .padding(.top)
                        .padding(.trailing,28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Button {
                    Task {
                        try await viewModel.signIn()
                    }
                } label: {
                    Text("Log in")
                        .modifier(IGButtonFieldModifier())
                }
                .padding(.vertical)
                
                HStack{
                    
                    Rectangle().frame(width: (UIScreen.main.bounds.width / 2) - 40,height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle().frame(width: (UIScreen.main.bounds.width / 2) - 40,height: 0.5)
                }
                .foregroundColor(.gray)
                
                HStack{
                    Image("facebook_logo")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top,8)
                }
                Spacer()
                
                Divider()
                
                
                HStack{
                    Text("Don't have an account?")
                    
                    NavigationLink {
                       AddEmailView()
                            .navigationBarBackButtonHidden(true)
                        
                    } label: {
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }

                }
                .font(.footnote)
                .padding(.vertical,16)
            }
        }
        .environmentObject(viewModel)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
