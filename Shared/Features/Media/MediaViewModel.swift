//
//  MediaViewModel.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import Apollo
import Combine

class MediaViewModel: GraphQLViewModel, ObservableObject {
    @Published private(set) var media: MediaQuery.Data.Medium?

    let id: Int

    init(id: Int) {
        self.id = id
    }

    func load() {
        Future<MediaQuery.Data.Medium, GraphQLError> { promise in
            GraphQLNetwork.shared.fetch(query: MediaQuery(id: self.id)) { result in
                switch result {
                    case let .success(query):
                        if let media = query.data?.media {
                            promise(.success(media))
                        }

                        if let err = query.errors?.first {
                            promise(.failure(err))
                        }
                    case let .failure(err):
                        logger.error("\(err)")
                }
            }
        }.sink(receiveCompletion: completion) { media in
            self.media = media
        }.store(in: &cancellables)
    }

    func favorite() {
        guard let type = media?.type else {
            return
        }

        Future<FavoriteMutation.Data.ToggleFavourite, GraphQLError> { promise in
            GraphQLNetwork.shared.perform(mutation: FavoriteMutation(
                animeId: type == .anime ? self.id : nil,
                mangaId: type == .manga ? self.id : nil
            )) { result in
                switch result {
                    case let .success(query):
                        if let favorites = query.data?.toggleFavourite {
                            promise(.success(favorites))
                        }

                        if let err = query.errors?.first {
                            promise(.failure(err))
                        }
                    case let .failure(err):
                        logger.error("\(err)")
                }
            }
        }.sink(receiveCompletion: completion) { favorites in
            switch type {
                case .anime:
                    self.media?.isFavourite = favorites.anime?.nodes?.contains { $0?.id == self.id } ?? false
                case .manga:
                    self.media?.isFavourite = favorites.manga?.nodes?.contains { $0?.id == self.id } ?? false
                case .__unknown:
                    break
            }
        }.store(in: &cancellables)
    }
}
