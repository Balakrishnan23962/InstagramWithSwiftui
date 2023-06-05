//
//  ProfileHeaderView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 22/05/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User
    @State private var showEditProfile = false
    var body: some View {
        VStack{
            VStack(spacing: 10){
                HStack{
                    Image(user.profileImageUrl ?? "person.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        Spacer()
                    HStack{
                        Spacer()
                        UsersStatView(value: 3, title: "Posts")
                        Spacer()
                        UsersStatView(value: 10, title: "Followers")
                        Spacer()
                        UsersStatView(value: 130, title: "Following")
                        Spacer()
                    }
                }
                .padding(.horizontal)
                VStack(alignment: .leading,spacing: 4){
//                    if let fullName = user.userName {
                    Text(user.userName)
                            .font(.footnote)
                            .fontWeight(.semibold)
//                    }
                    if let bio = user.bio {
                        Text(bio)
                            .font(.footnote)
                    }
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal)
                Button {
                    if user.isCurrentUser {
                        showEditProfile.toggle()
                    }
                } label: {
                    Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                        .font(.subheadline)
                        .foregroundColor(user.isCurrentUser ? .black : .white)
                        .fontWeight(.semibold)
                        .frame(width: 400, height: 32)
                        .background(user.isCurrentUser ? .white : Color(.systemBlue))
                        .overlay {
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(user.isCurrentUser ? .gray : .clear,lineWidth: 1)
                        }
                        .cornerRadius(6)
                        
                }
                Divider()
            }
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditingProfileView(user: user)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: MockUsers().user[1])
    }
}
