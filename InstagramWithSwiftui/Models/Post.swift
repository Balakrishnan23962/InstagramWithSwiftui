//
//  Post.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 19/05/23.
//

import Foundation


struct Post: Identifiable, Codable, Hashable {
    let id : String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timeStamp: Date
    var user: User?
}


extension Post {
    
    static var mock_Posts: [Post] = [
        
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Test case", likes: 5, imageUrl: "lugia", timeStamp: Date(),user:MockUsers().user[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Wakanda Forever", likes: 1, imageUrl: "gojo", timeStamp: Date(),user:MockUsers().user[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Like this post", likes: 150, imageUrl: "lugia", timeStamp: Date(),user:MockUsers().user[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Like this post", likes: 200, imageUrl: "gojo", timeStamp: Date(),user:MockUsers().user[0])
    ]
}
