//
//  MainTabView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 15/05/23.
//

import SwiftUI

struct MainTabView: View {
    let user : User
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
           FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
                .onAppear{
                    selectedIndex = 0
                }
                .tag(0)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onAppear{
                    
                    selectedIndex = 1
                }
                .tag(1)
           uploadPosts(tabIndex: $selectedIndex)
                .tabItem {
                    Image(systemName: "plus.app")
                }
                .onAppear{
                    selectedIndex = 2
                }
                .tag(2)
            Text("Notificaitons")
                .tabItem {
                    Image(systemName: "heart")
                }
                .onAppear{
                    selectedIndex = 3
                }
                .tag(3)
            CurrentUserView(user: user)
                .tabItem {
                    Image(systemName: "person.fill")
                }
                .onAppear{
                    selectedIndex = 4
                }
                .tag(4)
        }
        .tint(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(user: MockUsers().user[0])
    }
}
