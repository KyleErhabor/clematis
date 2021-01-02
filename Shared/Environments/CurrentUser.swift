//
//  CurrentUser.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 9/26/20.
//

import Foundation

/// An observable object representing currently authenticated users.
///
/// - Attention:Apollo caches GraphQL queries by the query. This clashes with multi-user support, because one user may have a state not appropriate
/// for their account. For example, if I've completed Hunter x Hunter on my account, but haven't on another account, the first account to trigger the cache
/// write is how it'll be displayed for anyone else. With this dilemma, **caching is not enabled.**
class CurrentUser: ObservableObject {
    /// An array of users authenticated.
    ///
    /// The user can add as many accounts as they want, but the first user in the array represents the currently active user. The only time other users in the array
    /// will be mentioned is when the `fetchUsers(:)` or `handleIncomingURL(url:)` method is called.
    @Published private(set) var users = [CurrentUserQuery.Data.Viewer]()

    /// Fetches all users.
    ///
    /// This method will retrieve every user's access token from the user's default database. It will then fetch and update the `users` array one-by-one for each
    /// user fetched. If the fetch failed, the array won't be appended.
    ///
    /// To preserve the order of the `users` array, each user is fetched one at a time, so the order is presistent. This comes with the slight performance loss of
    /// not taking advantage of parallel requesting, but will only be noticable if the user has a large number of accounts.
    ///
    /// Under the hood, for every request, it updates the user's default database to set the account to fetch with. This is to communicate with the Apollo GraphQL
    /// interceptors, so is kept to the minimum of this method. The way other methods work is by retrieving the user access tokens, updating the position, and
    /// saving it.
    func fetchUsers() {
        let tokens = UserDefaults.standard.stringArray(forKey: SettingsKeys.accessTokens) ?? []

        if !tokens.isEmpty {
            // https://stackoverflow.com/a/46852224/14695788
            let queue = DispatchQueue(label: "\(Bundle.main.bundleIdentifier ?? "app")-fetchUsers")
            let group = DispatchGroup()
            let semaphore = DispatchSemaphore(value: 0)

            queue.async {
                for index in tokens.indices {
                    group.enter()

                    // The cache policy has been set to fetch to avoid state issues. It should always represent the
                    // user at the most up-to-date state, making a cache inappropriate for this task. This forces
                    // Apollo to get the viewer from the GraphQL API rather than setting it to nil occasionally.
                    //
                    // If the user access token is stored locally and is revoked on AniList, Apollo won't update this
                    // view or a few others (e.g. ActivityFeed), causing the user to be greeted with a blank screen.
                    // What should happen is the user is treated like a signed out user. This seems to be an issue
                    // with the way retrying interceptors works. It should work like this:
                    //
                    // 1. Add the token
                    // 2. Make the request
                    // 3. See the response
                    // 4. If the response errored because the token was invalid, remove the token locally and retry
                    // 5. Else, continue
                    //
                    // Apollo is failing at #4: instead, it keeps retrying to acting like the user defaults hasn't
                    // been cleared So it keeps adding the Authorization header when it shouldn't be. I don't know
                    // why this is happening (maybe threading issues?), but this issue should be resolved before
                    // production.
                    GraphQLNetwork.shared.fetch(query: CurrentUserQuery()) { result in
                        UserDefaults.standard.set((index + 1) % tokens.count, forKey: SettingsKeys.accountIndex)

                        switch result {
                            case .success(let query):
                                if let viewer = query.data?.viewer {
                                    self.users.append(viewer)
                                }

                                if let errors = query.errors?.filter({ $0.message != "Unauthorized." }) {
                                    if !errors.isEmpty {
                                        logger.error("\(errors)")
                                    }
                                }
                            case .failure(let err):
                                logger.error("\(err)")
                        }

                        semaphore.signal()
                        group.leave()
                    }

                    semaphore.wait()
                }
            }
        }
    }

    /// Swaps the currently active user for the user at the specified index.
    /// - Parameter index: The user in the `users` array by index.
    func switchUser(at index: Int) {
        var tokens = UserDefaults.standard.stringArray(forKey: SettingsKeys.accessTokens)!
        tokens.swapAt(index, 0)

        UserDefaults.standard.set(tokens, forKey: SettingsKeys.accessTokens)
        users.swapAt(index, 0)
    }

    /// Removes a user from the user's default database.
    /// - Parameter index: The user in the `users` array by index.
    func removeUser(at index: Int) {
        var tokens = UserDefaults.standard.stringArray(forKey: SettingsKeys.accessTokens)!
        tokens.remove(at: index)

        UserDefaults.standard.set(tokens, forKey: SettingsKeys.accessTokens)
        users.remove(at: index)
    }

    /// Handles an incoming URL from the URL scheme.
    ///
    /// This method will be called when a match with the URL scheme (amincapp://) is triggered. The following checks have been put in place for security:
    /// 1. The host (amincapp://host) must be `anilist`.
    /// 2. Fragments must be present and parsable to URL query items (?key=value). The fragment should not include the hashtag/pound symbol (#). The
    /// fragments will be used as the query items.
    /// 3. When iterating over the query items, value field must be present. To go along with this, one of the three keys should be present for each iteration.
    ///     1. `access_token`: The user access token.
    ///     2. `token_type`: Must be `bearer`.
    ///     3. `expires_in`: Must be parsable to an `Int`.
    /// 4. The access token must not already exist in the user's default database.
    ///
    /// If all checks pass, the user access token is inserted at the *front* of the array and added to the user's default database, along with all users being
    /// fetched.
    ///
    /// - Parameter url: The incoming URL.
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
                
                if hasTokenType && hasExpiredTimestamp, let accessToken = accessToken {
                    var tokens = UserDefaults.standard.stringArray(forKey: SettingsKeys.accessTokens) ?? []

                    if !tokens.contains(accessToken) {
                        tokens.insert(accessToken, at: 0)
                        UserDefaults.standard.set(tokens, forKey: SettingsKeys.accessTokens)

                        fetchUsers()
                    }
                }
            }
        }
    }
}
