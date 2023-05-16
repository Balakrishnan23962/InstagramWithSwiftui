//
//  SearchView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 16/05/23.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 15) {
                    ForEach(0 ... 10, id: \.self){ user in
                        SearchProfile()
                    }
                }
                .padding(.top)
                .searchable(text: $searchText, prompt: "Search")
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
