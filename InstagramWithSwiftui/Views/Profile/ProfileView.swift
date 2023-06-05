//
//  ProfileView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 15/05/23.
//

import SwiftUI

struct ProfileView: View {
    
    var user : User
    var posts : [Post] {
        return Post.mock_Posts.filter({$0.user?.userName == user.userName})
    }

    private let imageDimension : CGFloat = (UIScreen.main.bounds.width / 3) - 1
    var body: some View {
            ScrollView {
                ProfileHeaderView(user: user)
                .padding(.top,20)
                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: MockUsers().user[0])
    }
}
