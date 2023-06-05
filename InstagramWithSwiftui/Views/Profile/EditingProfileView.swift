//
//  EditingProfileView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 30/05/23.
//

import SwiftUI
import PhotosUI

struct EditingProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel : EditProfileViewModel
    
    init(user: User){
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    var body: some View {
        VStack {
            HStack{
                Button("Cancel") {
                    dismiss()
                }
                Spacer()
                Text("Edit Profile")
                Spacer()
                Button {
                    Task{
                        try await viewModel.updateUserData()
                    }
                } label: {
                    Text("Done")
                        .font(.headline)
                        .fontWeight(.bold)
                }
                
            }
            .padding(.horizontal)
            Divider()
            
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack{
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .foregroundColor(.white)
                            .background(.gray)
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    }
                    else {
                        Image(systemName: "person")
                            .resizable()
                            .foregroundColor(.white)
                            .background(.gray)
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    }
                    Text("Edit Profile Picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.vertical,8)
            Divider()
            
            VStack{
                EditProfileRowView(title: "Name", placeHolder: "Enter your name...", text: $viewModel.name)
                EditProfileRowView(title: "Bio", placeHolder: "Bio...", text: $viewModel.bio)
            }
            Spacer()
        }
    }
}

struct EditingProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditingProfileView(user: MockUsers().user[0])
    }
}
