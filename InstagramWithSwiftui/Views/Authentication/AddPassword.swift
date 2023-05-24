//
//  AddPassword.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 17/05/23.
//

import SwiftUI

struct AddPassword: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel

    var body: some View {
        VStack(spacing: 13){
            Text("Create a password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("Your password atleast 6 characters in length")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal,24)
                .padding([.leading,.trailing])

            SecureField("Password", text: $viewModel.password)
                .modifier(IGTextFieldModifier())

            NavigationLink {
                CompleteSignUpView()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Next")
                .modifier(IGButtonFieldModifier())
            }
            .padding(.vertical)
            Spacer()
               
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }

            }
        }
    }
}

struct AddPassword_Previews: PreviewProvider {
    static var previews: some View {
        AddPassword()
            .environmentObject(RegistrationViewModel())
    }
}
