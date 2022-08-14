//
//  ChatAppUsingSwiftUIApp.swift
//  ChatAppUsingSwiftUI
//
//  Created by Nosher Khalid on 16/07/2022.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      _ = Firestore.firestore()
    return true
  }
}

@main
struct ChatAppUsingSwiftUIApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            AppView()
        }
    }
}
