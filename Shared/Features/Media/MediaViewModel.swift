//
//  MediaViewModel.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 12/20/20.
//

import Apollo
import Foundation

class MediaViewModel: ObservableObject {
    @Published private(set) var media: MediaQuery.Data.Medium?

    private let id: Int

    init(id: Int) {
        self.id = id
    }

    func fetchMedia() {
        GraphQLNetwork.shared.fetch(query: MediaQuery(id: id)) { result in
            switch result {
                case let .success(query):
                    if let media = query.data?.media {
                        self.media = media
                    }

                    if let errors = query.errors {
                        logger.error("\(errors)")
                    }
                case let .failure(err):
                    logger.error("\(err)")
            }
        }
    }

    func favorite() {
        GraphQLNetwork.shared.perform(mutation: FavoriteMutation(
            animeId: self.media?.type == .anime ? id : nil,
            mangaId: self.media?.type == .manga ? id : nil
        )) { result in
            switch result {
                case .success(let query):
                    if query.data?.toggleFavourite != nil {
                        self.media?.isFavourite.toggle()
                    }

                    if let errors = query.errors {
                        logger.error("\(errors)")
                    }
                case .failure(let err):
                    logger.error("\(err)")
            }
        }
    }
}
