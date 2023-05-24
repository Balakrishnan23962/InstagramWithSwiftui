//
//  SearchService.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 24/05/23.
//

import Firebase
import Combine

struct userService {
    
    @MainActor
   static func fetchAllUsers() async throws -> Result<[User],Error>{
        let snapshots = try await Firestore.firestore().collection("users").getDocuments()
        let documents = snapshots.documents.compactMap( { try? $0.data(as: User.self) } )
        return .success(documents)
    }
}
