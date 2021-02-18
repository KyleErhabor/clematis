//
//  ThreadViewModel.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/2/21.
//

import Foundation

class ThreadViewModel: ObservableObject {
    @Published private(set) var thread: ThreadQuery.Data.Thread?
    @Published private(set) var comments = [ThreadQuery.Data.Page.ThreadComment]()
    @Published private(set) var pageInfo: ThreadQuery.Data.Page.PageInfo?
    private var page = 1

    let id: Int

    init(id: Int) {
        self.id = id
    }

    func load() {
        GraphQLNetwork.shared.fetch(query: ThreadQuery(id: id, page: 1)) { result in
            switch result {
                case let .success(query):
                    if let thread = query.data?.thread {
                        self.thread = thread
                    }

                    if let comments = query.data?.page?.threadComments?.compactMap({ $0 }), !comments.isEmpty {
                        self.comments = comments
                    }

                    if let pageInfo = query.data?.page?.pageInfo {
                        self.pageInfo = pageInfo
                    }

                    if let errors = query.errors {
                        logger.error("\(errors)")
                    }
                case let .failure(err):
                    logger.error("\(err)")
            }
        }
    }

    func next() {
        GraphQLNetwork.shared.fetch(query: ThreadQuery(id: id, page: page + 1)) { result in
            switch result {
                case let .success(query):
                    self.page += 1

                    if let thread = query.data?.thread {
                        self.thread = thread
                    }

                    if let comments = query.data?.page?.threadComments?.compactMap({ $0 }), !comments.isEmpty {
                        self.comments.append(contentsOf: comments)
                    }

                    if let pageInfo = query.data?.page?.pageInfo {
                        self.pageInfo = pageInfo
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
        GraphQLNetwork.shared.perform(mutation: ThreadSubscriptionMutation(
            id: id,
            subscribe: !(thread?.isSubscribed ?? false)
        )) { result in
            switch result {
                case let .success(query):
                    if let isSubscribed = query.data?.toggleThreadSubscription?.isSubscribed {
                        self.thread?.isSubscribed = isSubscribed
                    }

                    if let errors = query.errors {
                        logger.error("\(errors)")
                    }
                case let .failure(err):
                    logger.error("\(err)")
            }
        }
    }

    func like() {
        GraphQLNetwork.shared.perform(mutation: LikeMutation(id: id, type: .thread)) { result in
            switch result {
                case let .success(query):
                    if let like = query.data?.toggleLikeV2?.asThread {
                        self.thread?.isLiked = like.isLiked
                        self.thread?.likeCount = like.likeCount
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

//extension ThreadQuery.Data.Page.ThreadComment: Decodable {
//    enum CodingKeys: CodingKey {
//        case id
//        case createdAt
//        case childComments
//        case comment
//        case user
//    }
//
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        id = -1
//        createdAt = -1
//        comment = nil
//        user = nil
//        childComments = nil
////        id = try container.decode(Int.self, forKey: .id)
////        createdAt = try container.decode(Int.self, forKey: .createdAt)
////        comment = nil
////        user = nil
////        childComments = nil
//    }
//}
