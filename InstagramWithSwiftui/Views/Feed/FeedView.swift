//
//  FeedView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 15/05/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 34) {
                    ForEach(Post.mock_Posts,id: \.id) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top,8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("insta_logo")
                        .resizable()
                        .frame(width: 100, height: 32)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
