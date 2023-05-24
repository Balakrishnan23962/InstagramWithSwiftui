//
//  InstagramWithSwiftuiApp.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 15/05/23.
//

import SwiftUI
import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct InstagramWithSwiftuiApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
           ContentView()
        }
    }
}
