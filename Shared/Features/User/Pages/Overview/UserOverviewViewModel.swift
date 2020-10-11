//
//  UserOverviewViewModel.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 10/8/20.
//

import SwiftUI

class UserOverviewViewModel: ObservableObject {
    let id: Int

    @Published var activities = [UserActivityQuery.Data.Page.Activity]()

    init(id: Int) {
        self.id = id
    }

    func loadUserActivity(page: Int = 1, perPage: Int = 50) {
//        ApolloNetwork.shared.anilist.fetch(query: UserActivityQuery(
//            page: page,
//            perPage: perPage,
//            userID: id
//        )) { result in
//            switch result {
//                case .success(let queryData):
//                    if let activities = queryData.data?.page?.activities {
//                        self.activities.append(contentsOf: activities.compactMap { $0 })
//                    }
//                case .failure(let err): print(err)
//            }
//        }
    }
}
