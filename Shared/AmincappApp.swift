//
//  Anime_CatalogApp.swift
//  Shared
//
//  Created by Kyle Erhabor on 9/4/20.
//

import Logging
import SwiftUI

let logger = Logger(label: Bundle.main.bundleIdentifier ?? "app")

@main
struct AmincappApp: App {
    @StateObject private var currentUser = CurrentUser()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(currentUser)
                .onAppear {
                    currentUser.fetchUser()
                }
        }.commands {
            #if DEBUG
            CommandMenu("Debug") {
                Button("Log User Access Token") {
                    if let token = UserDefaults.standard.string(forKey: SettingsKeys.accessToken) {
                        logger.info("\(token)")
                    } else {
                        logger.notice("No user access token set")
                    }
                }
            }

            #endif
        }

        #if os(macOS)
        Settings {
            Text("TODO (Settings)")
        }

        #endif
    }
}
