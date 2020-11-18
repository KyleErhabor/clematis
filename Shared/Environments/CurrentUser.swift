//
//  CurrentUser.swift
//  Amincapp
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
                case .failure(let err): print(err)
            }
        }
    }
}
