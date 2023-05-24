//
//  UploadPostViewModel.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 22/05/23.
//

import Foundation
import PhotosUI
import SwiftUI


class  UploadPostViewModel : ObservableObject {
    @Published var selectedImage : PhotosPickerItem? {
        didSet {
            Task { await loadImage(fromItem: selectedImage)}
        }
    }
    @Published var postImage : Image?
    @Published var showPhotosPickerItem : Bool = false
    @Published var caption = ""
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {
            return
        }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        DispatchQueue.main.async {
            self.postImage = Image(uiImage: uiImage)
        }
    }
    
}
