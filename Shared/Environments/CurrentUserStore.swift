//
//  CurrentUserStore.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/8/21.
//

import AuthenticationServices
import Combine

/// The control center for accessing and managing AniList accounts logged in.
///
/// The `CurrentUserStore` class allows you to sign in, sign out, load, and access AniList accounts linked to this app. A person can add an unlimited number of
/// accounts and context-switch as they choose.
///
/// - Attention: At the mooment, this class is limited to one user. In the future, more users will be supported.
class CurrentUserStore: NSObject, ObservableObject {
    /// An array of users currently logged in.
    ///
    /// The first element in the array represents the current user, so the order will need to be modified to context-switch. There are a few case scenarios where the
    /// first user will not represent the current active user, such as when initializing the application to fetch all users.
    @Published private(set) var users = [CurrentUserQuery.Data.Viewer]()

    /// An error that occurred during some operation (loading, logging in, etc.)
    @Published private(set) var error: Error?

    /// Indicates whether the user running the app is signed in or not.
    var isSignedIn: Bool {
        !users.isEmpty
    }

    /// An array of pending cancellables.
    private var cancellables = [AnyCancellable]()

    /// Loads all users.
    ///
    /// The user's access token from the keychain is fetched and sent as the `Authorization` header to fetch necessary data about the user. The
    /// `CurrentUserQuery.Data.Viewer` GraphQL query holds data that's relevant about the user across the application to discourage refreshing.
    ///
    /// If loading a user fails due to an authorization failure, the user will be logged out and removed from the Keychain.
    func load() {
        if (try? keychain.contains("user")) == true {
            Future<CurrentUserQuery.Data.Viewer, Error> { promise in
                GraphQLNetwork.shared.fetch(query: CurrentUserQuery()) { result in
                    switch result {
                        case let .success(query):
                            if let viewer = query.data?.viewer {
                                promise(.success(viewer))
                            }

                            if let error = query.errors?.first(where: { $0.message == "Unauthorized." }) {
                                self.logout()

                                promise(.failure(error))
                            }
                        case let .failure(err):
                            promise(.failure(err))
                    }
                }
            }.sink { completion in
                if case let .failure(err) = completion {
                    self.error = err
                }
            } receiveValue: { viewer in
                self.users = [viewer]
            }.store(in: &cancellables)
        }
    }

    /// Prompts the user to sign in.
    ///
    /// When this method is called, the user will be prompted to sign in with their AniList account. This utilizes the `AuthenticationServices` framework to
    /// make authentication seamless and quick for users who may already be signed in. The authorization flow is strictly enforced to prevent vendors from
    /// mimicking a sign in attempt.
    ///
    /// 1. The app must have a bundle identifier.
    ///
    /// 2. The target URL resolves to `https://anilist.co/api/v2/oauth/authorize?client_id=YOUR_CLIENT_ID&response_type=token`
    /// for the request. `YOUR_CLIENT_ID` should be the API client ID created on the site.
    ///
    /// 3. The `AuthenticationServices` framework will visit the site with a native view for the user's device.
    ///
    ///     1. If the user is already signed in and has already accepted the app, the user will immediately be redited back to the app and continue.
    ///
    ///     2. If the user is already signed in but hasn't granted the app access, AniList will prompt the user to accept or decline.
    ///
    ///     3. If the user isn't signed in, AniList will prompt the user to sign in before redirecting to the accept/decline screen.
    ///
    /// 4. The response is then validated to check for any errors sending the request or any errors in the response URL. This includes parsing the URL to get the
    /// user token to send requests on behalf the user.
    ///
    /// 5. The user token is saved to the app's Keychain and the user list is refreshed to reflect new data.
    ///
    /// If any of these steps fail, the user won't be stored and authenticated. The `error` property may contain an error in light, but it may hold an error for other
    /// cases (such as if loading the user from the `load` method fails).
    func login() {
        guard let scheme = Bundle.main.bundleIdentifier else {
            return
        }

        var components = URLComponents()
        components.scheme = "https"
        components.host = "anilist.co"
        components.path = "/api/v2/oauth/authorize"
        components.queryItems = [
            .init(name: "client_id", value: "\(Constants.clientId)"),
            .init(name: "response_type", value: "token")
        ]

        guard let url = components.url else {
            return
        }

        Future<String, Error> { promise in
            let session = ASWebAuthenticationSession(
                url: url,
                callbackURLScheme: scheme
            ) { url, err in
                if let err = err {
                    promise(.failure(err))

                    return
                }

                guard let url = url else {
                    promise(.failure(CurrentUserStoreError.noUrl))

                    return
                }

                guard let token = self.validateUrl(url: url) else {
                    promise(.failure(CurrentUserStoreError.malformedUrl))

                    return
                }

                promise(.success(token))
            }

            session.presentationContextProvider = self
            session.start()
        }.sink { completion in
            if case let .failure(err) = completion {
                self.error = err
            }
        } receiveValue: { token in
            keychain["user"] = token
            self.load()
        }.store(in: &cancellables)
    }

    /// Removes all user from the Keychain and from the `users` array.
    ///
    /// - Note: In the future, this method will remove users at specified offsets instead of the entire list.
    func logout() {
        keychain["user"] = nil
        self.users = []
    }

    /// Processes the incoming URL possibly containing user authentication data.
    /// - Parameter url: The URL to process
    /// - Returns: The user's access token, or `nil` to signal validation did not pass.
    private func validateUrl(url: URL) -> String? {
        guard url.host == "callback",
              var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return nil
        }

        components.query = url.fragment

        var accessToken: String?
        var tokenType: String?
        var expirationDate: Date?

        for item in components.queryItems ?? [] {
            switch item.name {
                case "access_token":
                    guard accessToken == nil,
                          let token = item.value else {
                        return nil
                    }

                    accessToken = token
                case "token_type":
                    guard tokenType == nil,
                          let type = item.value,
                          type == "Bearer" else {
                        return nil
                    }

                    tokenType = type
                case "expires_in":
                    guard expirationDate == nil,
                          let value = item.value,
                          let time = TimeInterval(value) else {
                        return nil
                    }

                    expirationDate = Date(timeIntervalSinceNow: time)
                default:
                    return nil
            }
        }

        guard let token = accessToken,
              tokenType != nil && expirationDate != nil else {
            return nil
        }

        return token
    }
}

extension CurrentUserStore: ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
}

/// An enum holding possible errors for the `CurrentUserStore` class
fileprivate enum CurrentUserStoreError: Error {
    /// If no response URL was returned.
    case noUrl

    /// If the response URL did not pass validation.
    case malformedUrl
}
