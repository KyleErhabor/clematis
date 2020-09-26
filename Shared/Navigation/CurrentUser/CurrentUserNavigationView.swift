//
//  CurrentUserNavigationView.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 9/26/20.
//

import SwiftUI

struct CurrentUserNavigationView: View {
    @Environment(\.openURL) private var openURL
    @StateObject private var viewModel = CurrentUserNavigationViewModel()

    var body: some View {
        Group {
            if let user = viewModel.user {
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
        }.onAppear {
            viewModel.loadUser()
        }.onOpenURL { url in
            if let fragment = url.fragment {
                var components = URLComponents()
                components.query = fragment

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
                    }
                }
            }
        }
    }
}

struct CurrentUserNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserNavigationView()
    }
}
