//
//  CPBFirebaseApp.swift
//  CPBFirebase
//
//  Created by Calvin Rice on 11/6/23.
//

import SwiftUI
import FirebaseCore

@main
struct CPBFirebaseApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
