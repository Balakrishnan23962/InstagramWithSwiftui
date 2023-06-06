//
//  MockUSers.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 17/05/23.
//

import Foundation
import Combine

class MockUsers {
    
    var user : [User]
    
   init() {
       self.user = [
        User(id: NSUUID().uuidString,
                         userName: "Bala", profileImageUrl: nil, fullName: "Balakrishnan", bio: "Nothing", email: "bksnmka3B#"),
        User(id: NSUUID().uuidString, userName: "Guna", profileImageUrl: nil, fullName: "Gojo satoru", bio: "Gotham knights", email: "balabala@gmail.com")
       
       ]
       
   }
    
    
}

extension MockUsers {
    
    func getUsers() -> Result<User,Error> {
        return .success(MockUsers().user[1])
    }
    
}
