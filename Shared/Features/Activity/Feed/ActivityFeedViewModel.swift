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
        GraphQLNetwork.shared.fetch(query: ActivityFeedQuery(
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
        GraphQLNetwork.shared.perform(mutation: LikeMutation(
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
                        } else if let textActivity = kind.asTextActivity?.fragments.textActivityFragment {
                            if let index = self.activities.firstIndex(where: { $0.id == textActivity.id }) {
                                self.activities[index].asTextActivity!.fragments.textActivityFragment = textActivity
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
        GraphQLNetwork.shared.perform(mutation: ActivitySubscriptionMutation(
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
                        } else if let textActivity = kind.asTextActivity?.fragments.textActivityFragment {
                            if let index = self.activities.firstIndex(where: { $0.id == textActivity.id }) {
                                self.activities[index].asTextActivity!.fragments.textActivityFragment = textActivity
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

    func delete(id: Int) {
        // This has only been tested on an activity the user can't delete. In the future, this should tested on an
        // activity the user can delete to make sure it works.
        GraphQLNetwork.shared.perform(mutation: DeleteActivityMutation(id: id)) { result in
            switch result {
                case .success(let query):
                    if query.data?.deleteActivity?.deleted == true {
                        if let index = self.activities.firstIndex(where: { $0.id == id }) {
                            self.activities.remove(at: index)
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
