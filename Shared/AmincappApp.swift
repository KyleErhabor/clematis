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
    @StateObject var currentUser = CurrentUser()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(currentUser)
                .onAppear {
                    currentUser.fetchUsers()
                }.onOpenURL { url in
                    currentUser.handleIncomingURL(url: url)
                }
        }.commands {
            TextEditingCommands()

            #if DEBUG
            CommandMenu("Debug") {
                Button("Log User Access Token") {
                    if let tokens = UserDefaults.standard.stringArray(forKey: SettingsKeys.accessTokens),
                       !tokens.isEmpty {
                        logger.info("\(tokens[0])")
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
