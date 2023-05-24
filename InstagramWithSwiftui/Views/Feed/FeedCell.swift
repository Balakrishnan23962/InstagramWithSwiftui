//
//  FeedCell.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 15/05/23.
//

import SwiftUI

struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack{
            HStack{
                Image(post.user?.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text(post.user?.userName ?? "")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.leading,8)

            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            HStack(spacing: 16){
                Button {
                    print("Like")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                Button {
                    print("Comment")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }

                Button {
                    print("Share")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }

                Spacer()
            }
            .padding(.leading,8)
            .padding(.top,4)
            .foregroundColor(.black)


            Text("^[\(post.likes) like](inflect:true)")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
            Group {
                Text("\(post.user?.userName ?? "") ").fontWeight(.semibold) +
                Text("\(post.caption)")
            }
            .font(.footnote)
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.leading,10)
            .padding(.top,1)

            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
                .foregroundColor(.gray)
        }
        
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.mock_Posts[0])
    }
}
