//
//  AddEmailView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 16/05/23.
//

import SwiftUI

struct AddEmailView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 13){
            Text("Add your Email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("You will use this email to sign in to your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .padding(.horizontal,24)
            
            TextField("Email", text: $viewModel.email)
                .modifier(IGTextFieldModifier())
            
            
            NavigationLink {
                UserNameView()
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

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddEmailView()
                .environmentObject(RegistrationViewModel())
        }
    }
}
