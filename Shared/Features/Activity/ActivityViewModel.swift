//
//  ActivityViewModel.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 11/25/20.
//

import Foundation

class ActivityViewModel: ObservableObject {
    let id: Int

    @Published private(set) var activity: ActivityQuery.Data.Activity?

    init(id: Int) {
        self.id = id
    }

    func fetchActivity() {
        GraphQLNetwork.shared.anilist.fetch(query: ActivityQuery(id: id)) { result in
            switch result {
                case .success(let queryResult):
                    if let activity = queryResult.data?.activity {
                        self.activity = activity
                    }
                case .failure(let err): print(err)
            }
        }
    }
}
