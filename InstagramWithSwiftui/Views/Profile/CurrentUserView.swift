//
//  CurrentUserView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 19/05/23.
//

import SwiftUI

struct CurrentUserView: View {
    var user : User
    var posts : [Post] {
        return Post.mock_Posts.filter({$0.user?.userName == user.userName})
    }

    private let imageDimension : CGFloat = (UIScreen.main.bounds.width / 3) - 1
    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileHeaderView(user: user)
                .padding(.top,20)
                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }

                }
            }
        }
    }
}

struct CurrentUserView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserView(user: MockUsers().user[1])
    }
}
