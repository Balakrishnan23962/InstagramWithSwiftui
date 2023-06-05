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
    
    @Published var selectedImage : PhotosPickerItem? {
        didSet {
            Task { await loadImage(fromItem: selectedImage)}
        }
    }
    @Published var profileImage : Image?
    @Published var showPhotosPickerItem : Bool = false
    
    @Published var name = ""
    @Published var bio = ""
    
    init(user : User) {
        self.user = user
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {
            return
        }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        DispatchQueue.main.async {
            self.profileImage = Image(uiImage: uiImage)
        }
    }
    
    
    
    func updateUserData() async throws {
//       guard Auth.auth().currentUser != nil else {
//            return 
//        }
//        
        
        if !name.isEmpty && user.fullName != name {
            user.fullName = name
        }
        
        if bio.isEmpty && user.bio != bio {
            user.bio = bio 
        }
    }
}
