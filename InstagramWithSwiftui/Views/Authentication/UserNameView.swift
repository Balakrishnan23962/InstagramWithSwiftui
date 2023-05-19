//
//  UserNameView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 17/05/23.
//

import SwiftUI

struct UserNameView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var userName = ""
    
    var body: some View {
        VStack(spacing: 13){
            Text("Create username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("Pick a username for your new account. You can always change it later")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal,24)
                .padding([.leading,.trailing])
            
            TextField("Username", text: $userName)
                .modifier(IGTextFieldModifier())
            
            
            NavigationLink {
                AddPassword()
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

struct UserNameView_Previews: PreviewProvider {
    static var previews: some View {
        UserNameView()
    }
}
