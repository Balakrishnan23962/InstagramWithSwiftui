//
//  User.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 17/05/23.
//

import Foundation


struct User: Identifiable, Codable, Hashable {
    let id: String
    var userName : String
    var profileImageUrl: String?
    var fullName: String?
    var bio: String?
    let email: String
}
