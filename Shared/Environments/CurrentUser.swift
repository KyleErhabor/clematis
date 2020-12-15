//
//  CurrentUser.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 9/26/20.
//

import Foundation

class CurrentUser: ObservableObject {
    @Published private(set) var user: CurrentUserQuery.Data.Viewer?

    func fetchUser() {
        GraphQLNetwork.shared.anilist.fetch(query: CurrentUserQuery()) { result in
            switch result {
                case .success(let queryData):
                    if let viewer = queryData.data?.viewer {
                        self.user = viewer
                    }
                // Most likely 401 - Unauthorized.
                case .failure(let err):
                    logger.error("\(err)")
                    break
            }
        }
    }

    func removeUser() {
        UserDefaults.standard.set(nil, forKey: SettingsKeys.accessToken)
        user = nil
    }

    func handleIncomingURL(url: URL) {
        guard url.host == "anilist" else {
            return
        }

        if let fragment = url.fragment {
            var components = URLComponents()
            components.query = fragment

            var accessToken: String? = nil
            var hasTokenType = false
            var hasExpiredTimestamp = false

            if let queryItems = components.queryItems {
                for component in queryItems {
                    guard let value = component.value else {
                        return
                    }

                    switch component.name {
                        case "access_token":
                            accessToken = value
                        case "token_type":
                            guard value == "Bearer" else {
                                return
                            }

                            hasTokenType = true
                        case "expires_in":
                            guard Int(value) != nil else {
                                return
                            }

                            hasExpiredTimestamp = true
                        default:
                            return
                    }
                }

                if hasTokenType && hasExpiredTimestamp, let token = accessToken {
                    UserDefaults.standard.set(token, forKey: SettingsKeys.accessToken)
                    fetchUser()
                }
            }
        }
    }
}
