//
//  CurrentUser.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 9/26/20.
//

import SwiftUI

class CurrentUser: ObservableObject {
    @Published private(set) var user: CurrentUserQuery.Data.Viewer?

    func fetchUser() {
        GraphQLNetwork.shared.anilist.fetch(query: CurrentUserQuery()) { result in
            switch result {
                case .success(let queryData):
                    if let viewer = queryData.data?.viewer {
                        self.user = viewer
                    }
                // The error is most likely 401 Unauthorized.
                case .failure: break
            }
        }
    }
}
