//
//  CompleteSignUpView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 17/05/23.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var password = ""
    @StateObject var viewModel = SignUpFlowViewModel()
    var body: some View {
        VStack(spacing: 13){
            Spacer()
            VStack {
                Text("Welcome to Instagram")
                Text("Balakrishnan")
            }
            .font(.title2)
            .multilineTextAlignment(.center)
            .fontWeight(.bold)

            Text("Click below to complete registration and start using instagram")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal,24)
                .padding([.leading,.trailing])

        

            Button {
                
            } label: {
                Text("Complete Sign Up")
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

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUpView()
    }
}
