//
//  UsersStatView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 15/05/23.
//

import SwiftUI

struct UsersStatView: View {
    
    let value : Int
    let title: String
    var body: some View {
        HStack(spacing:8){
            VStack{
                Text("\(value)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("\(title)")
                    .font(.footnote)
            }
            .frame(width: 76)
        }
    }
}

struct UsersStatView_Previews: PreviewProvider {
    static var previews: some View {
        UsersStatView(value: 2, title: "Posts")
    }
}
