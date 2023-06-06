//
//  PlaceHolderView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 06/06/23.
//

import SwiftUI
import Kingfisher

struct PlaceHolderView: View {
    let user: User
    var body: some View {
        if let imageUrl = user.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
        }
        else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .foregroundColor(Color(.systemGray4))
        }

    }
}

struct PlaceHolderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceHolderView(user: MockUsers().user[1])
    }
}
