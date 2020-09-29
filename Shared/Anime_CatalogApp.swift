//
//  Anime_CatalogApp.swift
//  Shared
//
//  Created by Kyle Erhabor on 9/4/20.
//

import SwiftUI

@main
struct Anime_CatalogApp: App {
    @StateObject private var currentUser = CurrentUser()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear { currentUser.loadUser() }
                .environmentObject(currentUser)
        }
    }
}
