//
//  ContentView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 23/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        Group{
            if viewModel.userSession == nil {
                LoginView()
            }
            else if let currentUser = viewModel.Currentuser {
                MainTabView(user: currentUser)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
