//
//  ActivityListViewModel.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/31/21.
//

import Foundation

/// A view model representing a list activity.
///
/// A list activity (`ListActivityFragment`) represents an activity update from the user's anime & manga list. By default, all anime & manga list updates are
/// posted to a flowing activity feed. However, the results are filtered to only include activities that have at least one reply.
class ActivityListViewModel: ObservableObject {
    /// The list activity this view model belongs to.
    @Published private(set) var activity: ListActivityFragment

    /// Initializes the view model.
    /// - Parameter activity: The list activity this view model belongs to.
    init(activity: ListActivityFragment) {
        self.activity = activity
    }

    /// Delete the text activity.
    ///
    /// The activity will be removed from AniList and no longer be accessible. This is in contrast to a number of other operations that don't delete the object but
    /// replace the user who created it.
    ///
    /// - Important: The current user must own this text activity to delete it.
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

    /// Toggle the like state for this activity.
    ///
    /// A user can like (or unlike) an activity. If the operation is successful, the like state and total like count for the activity are updated. This protects against a
    /// scenario where the total number of likes may be out of sync.
    ///
    /// - Warning: `activity.likes` is not updated due to the API always returning `nil` in the query fields.
    func like() {
        GraphQLNetwork.shared.perform(mutation: LikeMutation(id: activity.id, type: .activity)) { result in
            switch result {
                case let .success(query):
                    if let like = query.data?.toggleLikeV2?.asTextActivity {
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

    /// Toggle the subscription state for this activity.
    ///
    /// A user can subscribe to notifications from an activity for updates (such as when a new reply is posted). If the user's subscription state is `nil`, this
    /// method will try to subscribe to new notifications.
    func subscribe() {
        GraphQLNetwork.shared.perform(mutation: ActivitySubscriptionMutation(
            id: self.activity.id,
            subscribe: !(self.activity.isSubscribed ?? false)
        )) { result in
            switch result {
                case let .success(query):
                    if let isSubscribed = query.data?.toggleActivitySubscription?.asTextActivity?.isSubscribed {
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
}
