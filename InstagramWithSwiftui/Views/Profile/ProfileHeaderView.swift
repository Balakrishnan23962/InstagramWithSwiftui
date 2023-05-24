//
//  ProfileHeaderView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 22/05/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User
    var body: some View {
        VStack{
            VStack(spacing: 10){
                HStack{
                    Image(user.profileImageUrl ?? "")
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
                    
                } label: {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .frame(width: 400, height: 32)
                        .overlay {
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.gray,lineWidth: 1)
                        }
                        
                }
                Divider()
            }
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: MockUsers().user[1])
    }
}
