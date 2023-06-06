//
//  ImageUploader.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 05/06/23.
//

import SwiftUI
import UIKit
import FirebaseStorage

struct ImageUploader {
    
    static func uploadImage(image: UIImage) async throws -> String? {
        guard let imageDate = image.jpegData(compressionQuality: 0.5) else { return nil }
        let fileName = NSUUID().uuidString
        let refFile = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        do {
            let _ = try await refFile.putDataAsync(imageDate)
            let url = try await refFile.downloadURL()
            return url.absoluteString
        } catch{
            print("Error in Upload Image")
            return nil
        }
    }
}
