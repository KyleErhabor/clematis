//
//  ForumsViewModel.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/1/21.
//

import Foundation

class ForumsViewModel: ObservableObject {
    @Published private(set) var threads = [ForumsQuery.Data.Page.Thread]()

    func load() {
        GraphQLNetwork.shared.fetch(query: ForumsQuery()) { result in
            switch result {
                case let .success(query):
                    if let threads = query.data?.page?.threads?.compactMap({ $0 }), !threads.isEmpty {
                        self.threads = threads
                    }

                    if let errors = query.errors {
                        logger.error("\(errors)")
                    }
                case let .failure(err):
                    logger.error("\(err)")
            }
        }
    }

    func subscribe(id: Int, subscribe: Bool) {
        GraphQLNetwork.shared.perform(mutation: ThreadSubscriptionMutation(id: id, subscribe: subscribe)) { result in
            switch result {
                case let .success(query):
                    if let isSubscribed = query.data?.toggleThreadSubscription?.isSubscribed,
                       let index = self.threads.firstIndex(where: { $0.id == id }) {
                        self.threads[index].isSubscribed = isSubscribed
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
        GraphQLNetwork.shared.perform(mutation: LikeMutation(id: id, type: .thread)) { result in
            switch result {
                case let .success(query):
                    if let like = query.data?.toggleLikeV2?.asThread,
                       let index = self.threads.firstIndex(where: { $0.id == id }) {
                        self.threads[index].isLiked = like.isLiked
                        self.threads[index].likeCount = like.likeCount
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
