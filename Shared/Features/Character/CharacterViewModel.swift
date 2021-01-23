//
//  CharacterViewModel.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/22/21.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published private(set) var character: CharacterQuery.Data.Character?

    let id: Int

    init(id: Int) {
        self.id = id
    }

    func load() {
        GraphQLNetwork.shared.fetch(query: CharacterQuery(id: id)) { result in
            switch result {
                case let .success(query):
                    if let character = query.data?.character {
                        self.character = character
                    }

                    if let errors = query.errors {
                        logger.error("\(errors)")
                    }
                case let .failure(err):
                    logger.error("\(err)")
            }
        }
    }

    func fetchNextMedia(page: Int) {
        GraphQLNetwork.shared.fetch(query: CharacterQuery(id: id, mediaPage: page)) { result in
            switch result {
                case let .success(query):
                    if let media = query.data?.character?.media {
                        self.character?.media?.pageInfo = media.pageInfo
                        self.character?.media?.edges?.append(contentsOf: media.edges ?? [])
                    }
                    
                    if let errors = query.errors {
                        logger.error("\(errors)")
                    }
                case let .failure(err):
                    logger.error("\(err)")
            }
        }
    }

    func toggleFavorite() {
        GraphQLNetwork.shared.perform(mutation: FavoriteMutation(characterId: id)) { result in
            switch result {
                case let .success(query):
                    if let nodes = query.data?.toggleFavourite?.characters?.nodes {
                        self.character?.isFavourite = nodes.contains(where: { $0?.id == self.id })
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
