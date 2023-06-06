//
//  SearchProfile.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 16/05/23.
//

import SwiftUI
import Kingfisher

struct SearchProfile: View {
    var user: User
    var body: some View {
        NavigationLink(value: user, label: {
            HStack {
                if let image = user.profileImageUrl {
                    KFImage(URL(string: image))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40,height: 40)
                        .clipShape(Circle())
                }
                else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40,height: 40)
                        .clipShape(Circle())
                }
                VStack(alignment: .leading,spacing: 1){
                    Group {
                        Text(user.userName)
                            .fontWeight(.semibold)
                        if let fullName = user.fullName {
                            Text(fullName)
                        }
                    }
                    .font(.footnote)
                }
                Spacer()
            }
        })
        .tint(.black)
        .padding(.horizontal)
        .navigationDestination(for: User.self) { user in
            ProfileView(user: user)
        }
    }
}

struct SearchProfile_Previews: PreviewProvider {
    static var previews: some View {
        SearchProfile(user: MockUsers().user[1])
    }
}
