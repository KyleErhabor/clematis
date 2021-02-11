//
//  Anime_CatalogApp.swift
//  Shared
//
//  Created by Kyle Erhabor on 9/4/20.
//

import KeychainAccess
import Logging
import SwiftUI

let keychain = Keychain(service: Constants.appIdentifier)
let logger = Logger(label: Constants.appIdentifier)

@main
struct AmincappApp: App {
    @StateObject private var userStore = CurrentUserStore()
    @StateObject var currentUser = CurrentUser() // TO DELETE AND REPLACE

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(currentUser)
                .environmentObject(userStore)
                .onAppear {
                    userStore.load()
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
