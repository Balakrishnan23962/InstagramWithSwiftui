//
//  EditProfileViewModel.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 30/05/23.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

class EditProfileViewModel : ObservableObject {
    
    @Published var user: User
    @Published var isLoading = false
    @Published var selectedImage : PhotosPickerItem? {
        didSet {
            Task { await loadImage(fromItem: selectedImage)}
        }
    }
    @Published var profileImage : Image?
    @Published var showPhotosPickerItem : Bool = false
    
    @Published var name = ""
    @Published var bio = ""
    private var uiImage : UIImage?
    init(user : User) {
        self.user = user
        
        if let fullName = user.fullName {
            self.name = fullName
        }
        if let bio = user.bio {
            self.bio = bio
        }
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {
            return
        }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        DispatchQueue.main.async {
            self.profileImage = Image(uiImage: uiImage)
        }
    }
    
    
    
    func updateUserData() async throws {
        
        isLoading = true
        
        var data = [String: Any]()
//       guard Auth.auth().currentUser != nil else {
//            return 
//        }
//        
        if let uiImage = uiImage {
           let imageUrl = try await ImageUploader.uploadImage(image: uiImage)
           data["profileImageUrl"] = imageUrl
        }
        if !name.isEmpty && user.fullName != name {
            data["fullName"] = name
            
        }
        
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
            isLoading = false
        }
    }
}
