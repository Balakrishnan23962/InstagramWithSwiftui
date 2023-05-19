//
//  ProfileView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 15/05/23.
//

import SwiftUI

struct ProfileView: View {
    
    var user : User
    
    private let gridItems : [GridItem] = [
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1)
    ]
    var body: some View {
            ScrollView {
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
                            if let fullName = user.fullName {
                                Text(fullName)
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                            }
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
                    
                    LazyVGrid(columns: gridItems,spacing: 1) {
                        
                        ForEach(1 ... 40, id: \.self) { _ in
                            Image("gojo")
                                .resizable()
                                .scaledToFit()
                        }
                        
                    }
                }
                .padding(.top,20)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: MockUsers().user[1])
    }
}
