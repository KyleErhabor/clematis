//
//  ActivityListViewModel.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/31/21.
//

import Foundation

class ActivityListViewModel: ObservableObject {
    @Published private(set) var activity: ListActivityFragment

    init(activity: ListActivityFragment) {
        self.activity = activity
    }

    func like() {
        GraphQLNetwork.shared.perform(mutation: LikeMutation(id: activity.id, type: .activity)) { result in
            switch result {
                case let .success(query):
                    if let like = query.data?.toggleLikeV2?.asListActivity {
                        self.activity.isLiked = like.isLiked
                        self.activity.likeCount = like.likeCount
                    }

                    if let errors = query.errors {
                        logger.error("\(errors)")
                    }
                case let .failure(err):
                    logger.error("\(err)")
            }
        }
    }

    func subscribe() {
        GraphQLNetwork.shared.perform(mutation: ActivitySubscriptionMutation(
            id: activity.id,
            subscribe: !(activity.isSubscribed ?? false)
        )) { result in
            switch result {
                case let .success(query):
                    if let isSubscribed = query.data?.toggleActivitySubscription?.asListActivity?.isSubscribed {
                        self.activity.isSubscribed = isSubscribed
                    }

                    if let errors = query.errors {
                        logger.error("\(errors)")
                    }
                case let .failure(err):
                    logger.error("\(err)")
            }
        }
    }

    func delete() {
        GraphQLNetwork.shared.perform(mutation: DeleteActivityMutation(id: activity.id)) { result in
            switch result {
                case let .success(query):
                    if let errors = query.errors {
                        logger.error("\(errors)")
                    }
                case let .failure(err):
                    logger.error("\(err)")
            }
        }
    }
}
