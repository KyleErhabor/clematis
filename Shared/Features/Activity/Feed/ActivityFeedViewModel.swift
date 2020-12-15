//
//  ActivityFeedViewModel.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 12/5/20.
//

import Combine

class ActivityFeedViewModel: ObservableObject {
    @Published private(set) var activities = [ActivityFeedQuery.Data.Page.Activity]()

    func fetchActivities(page: Int = 1, isFollowing: Bool = false) {
        GraphQLNetwork.shared.anilist.fetch(query: ActivityFeedQuery(
            page: page,
            isFollowing: isFollowing,
            hasRepliesOrTypeText: !isFollowing,
            includeBuggyFields: true
        )) { result in
            switch result {
                case .success(let query):
                    if let activities = query.data?.page?.activities?.compactMap({ $0 }) {
                        if !activities.isEmpty {
                            self.activities = activities
                        }
                    }
                case .failure(let err):
                    logger.error("\(err)")
            }
        }
    }

    func like(id: Int, type: LikeableType) {
        GraphQLNetwork.shared.anilist.perform(mutation: LikeMutation(
            id: id,
            type: type,
            includeBuggyFields: false
        )) { result in
            switch result {
                case .success(let query):
                    if let kind = query.data?.toggleLikeV2 {
                        if let listActivity = kind.asListActivity?.fragments.listActivityFragment {
                            if let index = self.activities.firstIndex(where: { $0.id == listActivity.id }) {
                                self.activities[index].asListActivity!.fragments.listActivityFragment = listActivity
                            }
                        }
                    }

                    if let errors = query.errors {
                        logger.error("\(errors)")
                    }
                case .failure(let err):
                    logger.error("\(err)")
            }
        }
    }

    func subscribe(id: Int, subscribe: Bool) {
        GraphQLNetwork.shared.anilist.perform(mutation: ActivitySubscriptionMutation(
            id: id,
            subscribe: subscribe,
            includeBuggyFields: false
        )) { result in
            switch result {
                case .success(let query):
                    if let kind = query.data?.toggleActivitySubscription {
                        // TODO: Add `asTextActivity` and `asMessageActivity` cases.
                        if let listActivity = kind.asListActivity?.fragments.listActivityFragment {
                            if let index = self.activities.firstIndex(where: { $0.id == listActivity.id }) {
                                self.activities[index].asListActivity!.fragments.listActivityFragment = listActivity
                            }
                        }
                    }

                    if let errors = query.errors {
                        logger.error("\(errors)")
                    }
                case .failure(let err):
                    logger.error("\(err)")
            }
        }
    }
}
