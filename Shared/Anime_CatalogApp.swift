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
                .environmentObject(currentUser)
                .onAppear {
                    currentUser.loadUser()
                }
        }.commands {
            #if DEBUG
            CommandMenu("Debug") {
                Button("Log Access Token") {
                    print(UserDefaults.standard.string(forKey: SettingsKeys.accessToken) ?? "")
                }
            }

            #endif
        }

        #if os(macOS)
        Settings {
            Text("Hello, world!")
        }

        #endif
    }
}
