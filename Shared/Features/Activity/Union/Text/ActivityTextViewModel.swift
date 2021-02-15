//
//  ActivityTextViewModel.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/7/21.
//

import Apollo
import Combine

/// A view model representing a text activity.
///
/// A text activity (`TextActivityFragment`) represents an activity update where the user posts a public message for everyone to see. This includes
/// posting a message in the activity feed (but not replying to a text activity) or writing a message on one's own profile (but not replying to a message on one's own
/// profile). When another user posts a message on someone else's profile, this is known as a message activity (`MessageActivityFragment`).
class ActivityTextViewModel: ObservableObject {
    /// The text activity this view model belongs to.
    @Published private(set) var activity: TextActivityFragment

    /// An error that occurred during some operation.
    @Published var error: GraphQLError?

    /// An array of pending cancellables.
    private var cancellables = [AnyCancellable]()

    /// Initializes the view model.
    /// - Parameter activity: The text activity this view model belongs to.
    init(activity: TextActivityFragment) {
        self.activity = activity
    }

    /// Delete the text activity.
    ///
    /// The activity will be removed from AniList and no longer be accessible. This is in contrast to a number of other operations that don't delete the object but
    /// replace the user who created it.
    ///
    /// - Important: The current user must own this text activity to delete it.
    func delete() {
        Future<Void, GraphQLError> { promise in
            GraphQLNetwork.shared.perform(mutation: DeleteActivityMutation(id: self.activity.id)) { result in
                switch result {
                    case let .success(query):
                        if query.data?.deleteActivity?.deleted == true {
                            promise(.success(()))
                        }

                        if let err = query.errors?.first {
                            promise(.failure(err))
                        }
                    case let .failure(err):
                        logger.error("\(err)")
                }
            }
        }.sink(receiveCompletion: completion) {
            // FIXME: https://github.com/LiteLT/Amincapp-Apple/issues/5
        }.store(in: &cancellables)
    }

    /// Toggle the like state for this activity.
    ///
    /// A user can like (or unlike) an activity. If the operation is successful, the like state and total like count for the activity are updated. This protects against a
    /// scenario where the total number of likes may be out of sync.
    ///
    /// - Warning: `activity.likes` is not updated due to the API always returning `nil` in the query fields.
    func like() {
        Future<LikeMutation.Data.ToggleLikeV2.AsTextActivity, GraphQLError> { promise in
            GraphQLNetwork.shared.perform(mutation: LikeMutation(id: self.activity.id, type: .activity)) { result in
                switch result {
                    case let .success(query):
                        if let like = query.data?.toggleLikeV2?.asTextActivity {
                            promise(.success(like))
                        }

                        if let err = query.errors?.first {
                            promise(.failure(err))
                        }
                    case let .failure(err):
                        logger.error("\(err)")
                }
            }
        }.sink(receiveCompletion: completion) { like in
            self.activity.isLiked = like.isLiked
            self.activity.likeCount = like.likeCount
        }.store(in: &cancellables)
    }

    /// Toggle the subscription state for  this activity.
    ///
    /// A user can subscribe to notifications from an activity for updates (such as when a new reply is posted). If the user's subscription state is `nil`, this
    /// method will try to subscribe to new notifications.
    func subscribe() {
        Future<Bool, GraphQLError> { promise in
            GraphQLNetwork.shared.perform(mutation: ActivitySubscriptionMutation(
                id: self.activity.id,
                subscribe: !(self.activity.isSubscribed ?? false)
            )) { result in
                switch result {
                    case let .success(query):
                        if let isSubscribed = query.data?.toggleActivitySubscription?.asTextActivity?.isSubscribed {
                            promise(.success(isSubscribed))
                        }

                        if let err = query.errors?.first {
                            promise(.failure(err))
                        }
                    case let .failure(err):
                        logger.error("\(err)")
                }
            }
        }.sink(receiveCompletion: completion) { isSubscribed in
            self.activity.isSubscribed = isSubscribed
        }.store(in: &cancellables)
    }

    /// The completion handler for combine's `.sink(receiveCompletion:receiveValue:)` subscriber.
    ///
    /// The completion handler checks if the subscriber finished abnormally. If it did, the `error` property is set to the error so the view can handle the error
    /// accordingly (often displaying the error to the user).
    ///
    /// - Parameter completion: The completion instance.
    private func completion(_ completion: Subscribers.Completion<GraphQLError>) {
        if case let .failure(err) = completion {
            self.error = err
        }
    }
}

extension ActivityTextViewModel: MarkdownEditorViewModel {
    var name: String {
        "Text"
    }

    func save(text: String) {
        Future<TextActivityFragment, GraphQLError> { promise in
            GraphQLNetwork.shared.perform(mutation: SaveTextActivityMutation(
                id: self.activity.id,
                text: text
            )) { result in
                switch result {
                    case let .success(query):
                        if let activity = query.data?.saveTextActivity?.fragments.textActivityFragment {
                            promise(.success(activity))
                        }

                        if let err = query.errors?.first {
                            promise(.failure(err))
                        }
                    case let .failure(err):
                        logger.error("\(err)")
                }
            }
        }.sink(receiveCompletion: completion) { activity in
            self.activity = activity
        }.store(in: &cancellables)
    }
}
