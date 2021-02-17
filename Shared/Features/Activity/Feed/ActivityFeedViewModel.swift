//
//  ActivityFeedViewModel.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/31/21.
//

import Apollo
import Combine
import Foundation

/// The view model for the activity feed.
///
/// The activity feed features all list, text, and message activity updates from all users on the platform. The activity feed the user sees is limited to list activities with at
/// least 1 reply or any text activities to the global feed (excluding messages to the user).
///
/// The view model allows you to access, load, and paginate through activities.
class ActivityFeedViewModel: GraphQLViewModel, ObservableObject {
    /// An array of activities (text, activity, message).
    @Published private(set) var activities = [ActivityFeedQuery.Data.Page.Activity]()

    /// The current page information.
    @Published private(set) var pageInfo: ActivityFeedQuery.Data.Page.PageInfo?

    /// The current activity feed tab.
    ///
    /// The current tab the user has selected determines what activities the user sees. Defaults to `ActivityFeedTab.global`
    @Published var tab = ActivityFeedTab.global

    /// Loads the first page of activities.
    ///
    /// This method fetches first page of activities. If successful, the `activities` array is set the contents of the first page to remove any data from previous
    /// fetching. To get the contents of the next page, use the `next()` method.
    func load() {
        Future<ActivityFeedQuery.Data.Page, GraphQLError> { promise in
            GraphQLNetwork.shared.fetch(query: ActivityFeedQuery(
                page: 1,
                isFollowing: self.tab == .following,
                hasRepliesOrTypeText: self.tab == .global
            )) { result in
                switch result {
                    case let .success(query):
                        if let page = query.data?.page {
                            promise(.success(page))
                        }

                        if let err = query.errors?.first {
                            promise(.failure(err))
                        }
                    case let .failure(err):
                        logger.error("\(err)")
                }
            }
        }.sink(receiveCompletion: completion) { page in
            if let pageInfo = page.pageInfo {
                self.pageInfo = pageInfo
            }

            if let activities = page.activities?.compactMap({ $0 }) {
                self.activities = activities
            }
        }.store(in: &cancellables)
    }

    /// Loads the next page of activities.
    ///
    /// The page from the previous operation is used to fetch the next page of activities.
    ///
    /// - Attention: The activities in the response may overlap with some in the `activities` array. AniList does not provide an offset for the last activity
    /// ID except for the `createdAt_lesser` argument (timestamp). There may be an attempt to filter activities in the future.
    /// - Requires: `pageInfo?.currentPage != nil`
    func next() {
        guard let page = pageInfo?.currentPage else {
            return
        }

        Future<ActivityFeedQuery.Data.Page, GraphQLError> { promise in
            GraphQLNetwork.shared.fetch(query: ActivityFeedQuery(
                page: page + 1,
                isFollowing: self.tab == .following,
                hasRepliesOrTypeText: self.tab == .global
            )) { result in
                switch result {
                    case let .success(query):
                        if let page = query.data?.page {
                            promise(.success(page))
                        }

                        if let err = query.errors?.first {
                            promise(.failure(err))
                        }
                    case let .failure(err):
                        logger.error("\(err)")
                }
            }
        }.sink(receiveCompletion: completion) { page in
            if let pageInfo = page.pageInfo {
                self.pageInfo = pageInfo
            }

            if let activities = page.activities?.compactMap({ $0 }) {
                self.activities.append(contentsOf: activities)
            }
        }.store(in: &cancellables)
    }
}

/// The current activity feed tab we're in.
///
/// The current tab the user has selected determines what activities the user sees.
enum ActivityFeedTab: String, CaseIterable {
    /// The following feed.
    /// - **List**: Must be from a user the current user is following.
    /// - **Text**: Must be from a user the current user is following.
    /// - **Message**: Not included.
    case following

    /// The global feed.
    /// - **List**: Must have at least one message.
    /// - **Text**: All
    /// - **Message**: Not included.
    case global
}
