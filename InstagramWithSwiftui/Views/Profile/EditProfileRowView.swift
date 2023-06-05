//
//  EditProfileRowView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 30/05/23.
//

import SwiftUI

struct EditProfileRowView: View {
    
    let title: String
    let placeHolder : String
    @Binding var text : String
    var body: some View {
        VStack {
            HStack{
                Text(title)
                    .padding(.leading,8)
                    .frame(width: 100,alignment: .leading)
                
                VStack{
                    TextField(placeHolder,text: $text)
                    Divider()
                }
                .font(.subheadline)
                .frame(height: 36)

            }
//            HStack{
//                Text(title)
//                    .padding(.leading,8)
//                    .frame(width: 100,alignment: .leading)
//
//                VStack{
//                    TextField(placeHolder,text: $text)
//                    Divider()
//                }
//                .font(.subheadline)
//                .frame(height: 36)
//
//            }

        }
    }
}

struct EditProfileRowView_Previews: PreviewProvider {
    @State var isg = "Hi"
    static var previews: some View {
        EditProfileRowView(title: "Hi", placeHolder: "Hi", text: .constant("Go"))
    }
}
