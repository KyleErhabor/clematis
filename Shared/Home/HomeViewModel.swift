//
//  HomeViewModel.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 9/4/20.
//

import Foundation
import Apollo

class HomeViewModel: ObservableObject {
    @Published private(set) var activities = [GlobalActivityFeedQuery.Data.Page.Activity.Fragments]()

    func loadActivities() {
        ApolloNetwork.shared.anilist.fetch(query: GlobalActivityFeedQuery(page: 1, perPage: 50)) { result in
            switch result {
                case .success(let queryData):
                    if let activities = queryData.data?.page?.activities {
                        self.activities.append(contentsOf: activities.compactMap { $0?.fragments })
                    }
                case .failure(let err): print(err) // TODO: Handle the error.
            }
        }
    }
}
