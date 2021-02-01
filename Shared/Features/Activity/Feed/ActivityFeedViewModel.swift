//
//  ActivityFeedViewModel.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/31/21.
//

import Foundation

class ActivityFeedViewModel: ObservableObject {
    @Published private(set) var activities = [ActivityFeedQuery.Data.Page.Activity]()
    @Published private(set) var pageInfo: ActivityFeedQuery.Data.Page.PageInfo?

    func load(isFollowing: Bool) {
        GraphQLNetwork.shared.fetch(query: ActivityFeedQuery(
            isFollowing: isFollowing,
            hasRepliesOrTypeText: !isFollowing
        )) { result in
            switch result {
                case let .success(query):
                    if let page = query.data?.page {
                        if let pageInfo = page.pageInfo {
                            self.pageInfo = pageInfo
                        }

                        if let activities = page.activities?.compactMap({ $0 }) {
                            self.activities = activities
                        }
                    }

                    if let errors = query.errors {
                        logger.error("\(errors)")
                    }
                case let .failure(err):
                    logger.error("\(err)")
            }
        }
    }

    func next(page: Int, isFollowing: Bool) {
        GraphQLNetwork.shared.fetch(query: ActivityFeedQuery(
            page: page,
            isFollowing: isFollowing,
            hasRepliesOrTypeText: !isFollowing
        )) { result in
            switch result {
                case let .success(query):
                    if let page = query.data?.page {
                        if let pageInfo = page.pageInfo {
                            self.pageInfo = pageInfo
                        }

                        if let activities = page.activities?.compactMap({ $0 }).filter(self.filterDuplicate),
                           !activities.isEmpty {
                            self.activities.append(contentsOf: activities)
                        }
                    }

                    if let errors = query.errors {
                        logger.error("\(errors)")
                    }
                case let .failure(err):
                    logger.error("\(err)")
            }
        }
    }

    // NOTE: In the future, it may be more appropriate to filter the activity with the `createdAt_lesser` field on
    // `activities`. This method may exist afterwards to kill off any duplicates that managed to fit in between the
    // timestamps, but it's unlikely.
    func filterDuplicate(activity: ActivityFeedQuery.Data.Page.Activity) -> Bool {
        return !self.activities.contains { $0.id == activity.id }
    }
}

enum ActivityFeedTab: String, CaseIterable {
    case following
    case global
}
