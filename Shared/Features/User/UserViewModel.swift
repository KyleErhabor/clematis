//
//  UserViewModel.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/25/21.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published private(set) var user: UserQuery.Data.User?

    let id: Int

    init(id: Int) {
        self.id = id
    }

    func load() {
        GraphQLNetwork.shared.fetch(query: UserQuery(id: id)) { result in
            switch result {
                case let .success(query):
                    if let user = query.data?.user {
                        self.user = user
                    }

                    if let errors = query.errors {
                        logger.error("\(errors)")
                    }
                case let .failure(err):
                    logger.error("\(err)")
            }
        }
    }
}
