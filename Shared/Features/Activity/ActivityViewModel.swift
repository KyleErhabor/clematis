//
//  ActivityViewModel.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 11/21/20.
//

import Foundation

class ActivityViewModel: ObservableObject {
    @Published private(set) var activities = [ActivityFeedQuery.Data.Page.Activity]()

    /// Fetches the most recent activity updates from AniList.
    ///
    /// AniList manages the activity feed by clamping media progress updates together based on how much time has passed between the last update. All other
    /// kinds of activity updates are the responsibility of the developer.
    ///
    /// Mirroring the Following and Global feed varies on the value of `isFollowing`. `false` indicates the Following feed, while `true` inditicates the
    /// Global feed.
    ///
    /// - Parameters:
    ///   - page: The current page number for pagination.
    ///   - isFollowing: If the activities displayed should be from users the current user follows. This acts as the Following feed rather than the Global
    ///    feed.
    ///
    /// - Returns: `Void`. This method does not return a value. Instead, it updates the `activities` array with new activity (up to 50 new results). If
    /// there are no results or results updating older results, `activities` will not be updated, not triggering a UI refresh.
    ///
    func fetchActivities(page: Int = 1, isFollowing: Bool = false) {
        ApolloNetwork.shared.anilist.fetch(query: ActivityFeedQuery(
            page: page,
            perPage: 50,
            isFollowing: isFollowing,
            hasRepliesOrTypeText: !isFollowing
        )) { result in
            switch result {
                case .success(let queryData):
                    if let activities = queryData.data?.page?.activities {
                        // TODO: Update old activity in the `activities` array.
                        let activities = activities.compactMap { $0 }

                        if !activities.isEmpty {
                            self.activities = activities
                        }
                    }
                case .failure(let err): // MARK: UI error
                    print(err)
            }
        }
    }
}
