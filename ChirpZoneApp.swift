//
//  ChirpZoneApp.swift
//  ChirpZone
//
//  Created by Yogesh Lamba on 09/08/23.
//

import SwiftUI
import Firebase


//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    return true
//  }
//}

@main
struct ChirpZoneApp: App {
    // register app delegate for Firebase setup
     // @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var viewModel=AuthViewModel()
    init(){
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                 ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
