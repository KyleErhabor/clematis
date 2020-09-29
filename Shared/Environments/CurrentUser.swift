//
//  CurrentUser.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 9/26/20.
//

import SwiftUI

class CurrentUser: ObservableObject {
    @Published private(set) var user: SimpleCurrentUserQuery.Data.Viewer?

    func loadUser() {
        ApolloNetwork.shared.anilist.fetch(query: SimpleCurrentUserQuery()) { result in
            switch result {
                case .success(let queryData):
                    if let viewer = queryData.data?.viewer {
                        self.user = viewer
                    }
                // We're ignoring the error for now as the user may or may not be logged in. This works, but may be
                // changed in the future to have proper error handling.
                case .failure: break
            }
        }
    }
}
