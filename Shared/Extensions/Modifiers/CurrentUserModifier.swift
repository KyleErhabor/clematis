//
//  CurrentUserModifier.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 9/29/20.
//

import SwiftUI

fileprivate struct CurrentUserViewModifier: ViewModifier {
    @Environment(\.openURL) private var openURL
    @EnvironmentObject private var currentUser: CurrentUser

    func body(content: Content) -> some View {
        content.navigationBarItems(trailing: HStack {
            if let user = currentUser.user {
                Menu {
                    Button("Switch Account") {
                        print("Switched accounts")
                    }

                    Button("Sign Out") {
                        print("Signed out")
                    }
                } label: {
                    Label("\(user.name)", systemImage: "person.crop.circle")
                }
            } else {
                Button {
                    openURL(ApolloNetwork.ALMetadata.authURL)
                } label: {
                    Label("Sign In", systemImage: "person.crop.circle")
                }
            }
        }).onOpenURL { url in
            if let fragment = url.fragment {
                var components = URLComponents()
                components.query = fragment

                // It's ugly and doesn't cover cases where all three should be present, but it's good enough.
                if components.queryItems?.allSatisfy({ query in
                    guard query.value != nil else {
                        return false
                    }

                    switch query.name {
                        case "access_token": return true
                        case "token_type": return query.value == "Bearer"
                        case "expires_in": return Int(query.value!) != nil
                        default: return false
                    }
                }) == true {
                    if let token = components.queryItems?.first(where: { $0.name == "access_token" })?.value {
                        UserDefaults.standard.set(token, forKey: SettingsKeys.accessToken)
                        currentUser.objectWillChange.send()
                    }
                }
            }
        }
    }
}

extension View {
    func currentUser() -> some View {
        modifier(CurrentUserViewModifier())
    }
}
