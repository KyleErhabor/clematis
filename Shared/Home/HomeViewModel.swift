//
//  HomeViewModel.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 9/4/20.
//

import Foundation
import Apollo

class HomeViewModel: ObservableObject {
    @Published private(set) var activities = [ActivityFeedQuery.Data.Page.Activity.Fragments]()

    func loadActivities() {
        ApolloNetwork.shared.anilist.fetch(query: ActivityFeedQuery(page: 1, perPage: 50)) { result in
            switch result {
                case .success(let queryData):
                    if let activities = queryData.data?.page?.activities {
                        self.activities.append(contentsOf: activities.compactMap {
                            if let isAdult = $0?.fragments.listActivityFragment?.media?.isAdult,
                               isAdult == true {
                                return nil
                            }

                            return $0?.fragments
                        })
                    }
                case .failure(let err): print(err) // TODO: Handle the error.
            }
        }
    }
}
