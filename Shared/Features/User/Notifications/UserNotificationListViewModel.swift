//
//  UserNotificationListViewModel.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/30/21.
//

import Foundation

class UserNotificationListViewModel: ObservableObject {
    @Published private(set) var notifications = [UserNotificationsQuery.Data.Page.Notification]()

    func load() {
        GraphQLNetwork.shared.fetch(query: UserNotificationsQuery()) { result in
            switch result {
                case let .success(query):
                    if let notifications = query.data?.page?.notifications?.compactMap({ $0 }) {
                        self.notifications = notifications
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
