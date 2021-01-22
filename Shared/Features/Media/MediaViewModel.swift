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

    let id: Int

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

    func toggleFavorite(id: Int, for type: AniList.primaryTypes) {
        GraphQLNetwork.shared.perform(mutation: FavoriteMutation(
            animeId: type == .anime ? id : nil,
            mangaId: type == .manga ? id : nil,
            characterId: type == .character ? id : nil,
            staffId: type == .staff ? id : nil,
            studioId: type == .studio ? id : nil
        )) { result in
            switch result {
                case let .success(query):
                    if let favorites = query.data?.toggleFavourite {
                        switch type {
                            case .anime:
                                let isFavorite = favorites.anime?.nodes?.contains(where: { $0?.id == id }) == true

                                self.media?.isFavourite = isFavorite
                            case .manga:
                                let isFavorite = favorites.manga?.nodes?.contains(where: { $0?.id == id }) == true

                                self.media?.isFavourite = isFavorite
                            case .character:
                                let filter: (MediaQuery.Data.Medium.Character.Edge?) -> Bool = { $0?.node?.id == id }

                                if let index = self.media?.characters?.edges?.firstIndex(where: filter) {
                                    let fav = favorites.characters?.nodes?.contains(where: { $0?.id == id }) ?? false

                                    self.media!.characters!.edges![index]!.node!.isFavourite = fav
                                }
                            case .staff:
                                let fav = favorites.staff?.nodes?.contains(where: { $0?.id == id }) ?? false

                                for (edgeIndex, edge) in (self.media?.characters?.edges ?? []).enumerated() {
                                    for (staffIndex, staff) in (edge?.voiceActors ?? []).enumerated() {
                                        if staff?.id == id {
                                            self.media!.characters!.edges![edgeIndex]!.voiceActors![staffIndex]!
                                                .isFavourite = fav
                                        }
                                    }
                                }
                            case .studio:
                                if let index = self.media?.studios?.edges?.firstIndex(where: { $0?.node?.id == id }) {
                                    let fav = favorites.studios?.nodes?.contains(where: { $0?.id == id }) ?? false

                                    self.media!.studios!.edges![index]!.node!.isFavourite = fav
                                }
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

    func nextCharacterPage(page: Int) {
        GraphQLNetwork.shared.fetch(query: MediaQuery(id: id, characterPage: page)) { result in
            switch result {
                case let .success(query):
                    if let characters = query.data?.media?.characters {
                        self.media?.characters?.pageInfo = characters.pageInfo
                        self.media?.characters?.edges?.append(contentsOf: characters.edges ?? [])
                    }

                    if let errors = query.errors {
                        logger.error("\(errors)")
                    }
                case let .failure(err):
                    logger.error("\(err)")
            }
        }
    }

    func nextStaffPage(page: Int) {
        GraphQLNetwork.shared.fetch(query: MediaQuery(id: id, staffPage: page)) { result in
            switch result {
                case let .success(query):
                    if let staff = query.data?.media?.staff {
                        self.media?.staff?.pageInfo = staff.pageInfo
                        self.media?.staff?.edges?.append(contentsOf: staff.edges ?? [])
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
