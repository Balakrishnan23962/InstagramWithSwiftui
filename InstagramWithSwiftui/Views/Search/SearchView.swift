//
//  SearchView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 16/05/23.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    var body: some View {
        NavigationStack {
            ScrollView{
                if !viewModel.isLoading {
                    LazyVStack(spacing: 15) {
                        ForEach(viewModel.users, id: \.id){ user in
                            SearchProfile(user: user)
                        }
                    }
                    .padding(.top)
                .searchable(text: $searchText, prompt: "Search")
                }
                else{
                   ProgressView()
                }
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
