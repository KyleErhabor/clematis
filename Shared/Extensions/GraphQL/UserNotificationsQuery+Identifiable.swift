//
//  UserNotificationsQuery+Identifiable.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/30/21.
//

extension UserNotificationsQuery.Data.Page.Notification: Identifiable {
    public var id: Int {
        if let id = asAiringNotification?.id {
            return id
        } else if let id = asFollowingNotification?.id {
            return id
        } else if let id = asActivityMessageNotification?.id {
            return id
        } else if let id = asActivityMentionNotification?.id {
            return id
        } else if let id = asActivityReplyNotification?.id {
            return id
        } else if let id = asActivityReplySubscribedNotification?.id {
            return id
        } else if let id = asActivityLikeNotification?.id {
            return id
        } else if let id = asActivityReplyLikeNotification?.id {
            return id
        } else if let id = asThreadCommentMentionNotification?.id {
            return id
        } else if let id = asThreadCommentReplyNotification?.id {
            return id
        } else if let id = asThreadCommentSubscribedNotification?.id {
            return id
        } else if let id = asThreadCommentLikeNotification?.id {
            return id
        } else if let id = asThreadLikeNotification?.id {
            return id
        } else if let id = asRelatedMediaAdditionNotification?.id {
            return id
        }

        fatalError()
    }
}
