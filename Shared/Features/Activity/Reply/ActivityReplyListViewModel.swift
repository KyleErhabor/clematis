//
//  ActivityReplyListViewModel.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/31/21.
//

import Foundation

class ActivityReplyListViewModel: ObservableObject {
    @Published private(set) var replies = [ActivityReplyFragment]()

    let id: Int

    init(id: Int) {
        self.id = id
    }

    func load() {
        GraphQLNetwork.shared.fetch(query: ActivityRepliesQuery(id: id)) { result in
            switch result {
                case let .success(query):
                    if let activity = query.data?.activity {
                        if let replies = activity.asListActivity?.replies?
                            .compactMap({ $0?.fragments.activityReplyFragment }) {
                            self.replies = replies
                        }

                        if let replies = activity.asTextActivity?.replies?
                            .compactMap({ $0?.fragments.activityReplyFragment }) {
                            self.replies = replies
                        }

                        if let replies = activity.asMessageActivity?.replies?
                            .compactMap({ $0?.fragments.activityReplyFragment }) {
                            self.replies = replies
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

    func like(id: Int) {
        GraphQLNetwork.shared.perform(mutation: LikeMutation(id: id, type: .activityReply)) { result in
            switch result {
                case let .success(query):
                    if let like = query.data?.toggleLikeV2?.asActivityReply,
                       let index = self.replies.firstIndex(where: { $0.id == id }) {
                        self.replies[index].isLiked = like.isLiked
                        self.replies[index].likeCount = like.likeCount
                    }

                    if let errors = query.errors {
                        logger.error("\(errors)")
                    }
                case let .failure(err):
                    logger.error("\(err)")
            }
        }
    }

    func reply(id: Int?, text: String) {
        GraphQLNetwork.shared.perform(mutation: CreateOrUpdateActivityMutation(
            id: id,
            activityId: self.id,
            text: text
        )) { result in
            switch result {
                case let .success(query):
                    if let reply = query.data?.saveActivityReply?.fragments.activityReplyFragment {
                        if let id = id {
                            if let index = self.replies.firstIndex(where: { $0.id == id }) {
                                self.replies[index] = reply
                            }
                        } else {
                            self.replies.append(reply)
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
}
