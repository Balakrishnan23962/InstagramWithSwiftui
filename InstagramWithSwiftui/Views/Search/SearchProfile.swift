//
//  SearchProfile.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 16/05/23.
//

import SwiftUI

struct SearchProfile: View {
    var body: some View {
        HStack {
            Image("gojo")
                .resizable()
                .scaledToFill()
                .frame(width: 40,height: 40)
            .clipShape(Circle())
            VStack(alignment: .leading,spacing: 1){
                Group {
                    Text("Venom")
                        .fontWeight(.semibold)
                    Text("Eddie Brock")
                }
                .font(.footnote)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct SearchProfile_Previews: PreviewProvider {
    static var previews: some View {
        SearchProfile()
    }
}
