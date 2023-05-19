//
//  MainTabView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 15/05/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
           FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            Text("Upload Posts")
                .tabItem {
                    Image(systemName: "plus.app")
                }
            Text("Notificaitons")
                .tabItem {
                    Image(systemName: "heart")
                }
            CurrentUserView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
        .tint(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
