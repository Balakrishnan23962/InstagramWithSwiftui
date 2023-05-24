//
//  uploadPosts.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 22/05/23.
//

import SwiftUI
import PhotosUI

struct uploadPosts: View {
   @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    var body: some View {
        VStack{
            HStack{
                Button {
                    viewModel.caption = ""
                    viewModel.selectedImage = nil
                    viewModel.postImage = nil
                    tabIndex = 0
                } label: {
                    Text("Cancel")
                }
                Spacer()
                Text("New Post")
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }

            }
            .padding(.horizontal)
            HStack(spacing: 10){
                if let image = viewModel.postImage {
                   image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                TextField("Enter your caption...", text: $viewModel.caption,axis: .vertical)
            }
            .padding()
            Spacer()
                .onAppear {
                    viewModel.showPhotosPickerItem.toggle()
                }
                .photosPicker(isPresented: $viewModel.showPhotosPickerItem, selection: $viewModel.selectedImage)
        }
    }
}

struct uploadPosts_Previews: PreviewProvider {
    static var previews: some View {
        uploadPosts(tabIndex: .constant(3))
    }
}
