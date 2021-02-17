//
//  CharacterViewModel.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/22/21.
//

import Apollo
import Combine

/// A view model for a character.
class CharacterViewModel: GraphQLViewModel, ObservableObject {
    /// The character.
    @Published private(set) var character: CharacterQuery.Data.Character?

    /// The variant to use for sorting media this character is associated with.
    ///
    /// Defaults to `MediaSort.popularityDesc`
    @Published var mediaSort = MediaSort.popularityDesc

    /// The media type to filter for.
    ///
    /// By default, this value is `nil` (representing no filter).
    @Published var mediaType: MediaType?

    /// If to filter anime/manga associated with the character against the current user's list.
    ///
    /// This property is a filter for if the anime/manga is on the current user's list. `false` indicates any anime not on the user's list, while `true` indicates
    /// anime only on the user's list. The default value is `nil`, excluding the filter.
    @Published var isOnList: Bool?

    /// The voice actor's language to filter for.
    ///
    /// By default, this value is `nil` (representing no filter).
    @Published var voiceActorLanguage: StaffLanguage?

    /// The ID of the character.
    let id: Int

    /// Initializes the view model.
    /// - Parameter id: The ID of the character.
    init(id: Int) {
        self.id = id
    }

    /// Loads the character.
    ///
    /// This method fetches the character with `id` supplied along with the first page of anime/manga this character is associated with.
    ///
    /// - Attention: This method will overwrite what `character` is set to, including any pages under `character?.media?.edges`.
    func load() {
        Future<CharacterQuery.Data.Character, GraphQLError> { promise in
            GraphQLNetwork.shared.fetch(query: CharacterQuery(
                id: self.id,
                mediaPage: 1,
                mediaSort: [self.mediaSort],
                mediaType: self.mediaType,
                onList: self.isOnList,
                staffLanguage: self.voiceActorLanguage
            )) { result in
                switch result {
                    case let .success(query):
                        if let character = query.data?.character {
                            promise(.success(character))
                        }

                        if let err = query.errors?.first {
                            promise(.failure(err))
                        }
                    case let .failure(err):
                        logger.error("\(err)")
                }
            }
        }.sink(receiveCompletion: completion) { character in
            self.character = character
        }.store(in: &cancellables)
    }

    /// Loads the next page of anime/manga for this character.
    ///
    /// This method loads the next page of anime/manga associated with this character.
    ///
    /// - Warning: The character should be loaded before calling this method. Failing to do so will result in the value being discarded.
    /// - Requires: `character?.media?.pageInfo?.currentPage != nil`
    func nextMedia() {
        guard let mediaPage = character?.media?.pageInfo?.currentPage else {
            return
        }

        Future<CharacterQuery.Data.Character.Medium, GraphQLError> { promise in
            GraphQLNetwork.shared.fetch(query: CharacterQuery(
                id: self.id,
                mediaPage: mediaPage,
                mediaSort: [self.mediaSort],
                mediaType: self.mediaType,
                onList: self.isOnList,
                staffLanguage: self.voiceActorLanguage
            )) { result in
                switch result {
                    case let .success(query):
                        if let media = query.data?.character?.media {
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
            self.character?.media?.pageInfo = media.pageInfo
            self.character?.media?.edges?.append(contentsOf: media.edges ?? [])
        }.store(in: &cancellables)
    }

    /// Toggles the favorite state for this character for the current user.
    ///
    /// - Warning: The character should be loaded before calling this method. Failing to do so will result in the value being discarded.
    func toggleFavorite() {
        Future<[FavoriteMutation.Data.ToggleFavourite.Character.Node], GraphQLError> { promise in
            GraphQLNetwork.shared.perform(mutation: FavoriteMutation(characterId: self.id)) { result in
                switch result {
                    case let .success(query):
                        if let favorites = query.data?.toggleFavourite?.characters?.nodes?.compactMap({ $0 }) {
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
            self.character?.isFavourite = favorites.contains(where: { $0.id == self.id })
        }.store(in: &cancellables)
    }

    /// Toggles the favorite state for an anime/manga
    ///
    /// - Parameter media: The anime/manga to toggle.
    /// - Requires: `media.type != nil`
    func toggleFavorite(media: CharacterMediaEdge.Node) {
        guard let type = media.type else {
            return
        }

        Future<FavoriteMutation.Data.ToggleFavourite, GraphQLError> { promise in
            GraphQLNetwork.shared.perform(mutation: FavoriteMutation(
                animeId: type == .anime ? media.id : nil,
                mangaId: type == .manga ? media.id : nil
            )) { result in
                switch result {
                    case let .success(query):
                        if let toggle = query.data?.toggleFavourite {
                            promise(.success(toggle))
                        }

                        if let err = query.errors?.first {
                            promise(.failure(err))
                        }
                    case let .failure(err):
                        logger.error("\(err)")
                }
            }
        }.sink(receiveCompletion: completion) { toggle in
            switch type {
                case .anime:
                    if let index = self.character?.media?.edges?.firstIndex(where: { $0?.node?.id == media.id }) {
                        let isFavorite = toggle.anime?.nodes?.contains(where: { $0?.id == media.id }) == true

                        self.character?.media?.edges?[index]?.node?.isFavourite = isFavorite
                    }
                case .manga:
                    if let index = self.character?.media?.edges?.firstIndex(where: { $0?.node?.id == media.id }) {
                        let isFavorite = toggle.manga?.nodes?.contains(where: { $0?.id == media.id }) == true

                        self.character?.media?.edges?[index]?.node?.isFavourite = isFavorite
                    }
                case let .__unknown(variant):
                    logger.warning("Unknown MediaType enum variant: \(variant)")
            }
        }.store(in: &cancellables)
    }

    /// Toggles the favorite state for a voice actor for the current user.
    ///
    /// - Parameter staff: The voice actor to toggle the favorite state.
    /// - Warning: The character should be loaded before calling this method. Failing to do so will result in the value being discarded.
    func toggleFavorite(staff: CharacterMediaEdge.VoiceActor) {
        Future<[FavoriteMutation.Data.ToggleFavourite.Staff.Node], GraphQLError> { promise in
            GraphQLNetwork.shared.perform(mutation: FavoriteMutation(staffId: staff.id)) { result in
                switch result {
                    case let .success(query):
                        if let favorites = query.data?.toggleFavourite?.staff?.nodes?.compactMap({ $0 }) {
                            promise(.success(favorites))
                        }

                        if let err = query.errors?.first {
                            promise(.failure(err))
                        }
                    case let .failure(err):
                        logger.info("\(err)")
                }
            }
        }.sink(receiveCompletion: completion) { favorites in
            let isFavorite = favorites.contains(where: { $0.id == staff.id })

            // For each edge with the index
            for (edgeIndex, edge) in (self.character?.media?.edges ?? []).enumerated() {
                // For each voice actor with the index where the voice actor's ID is the same as the staff ID used
                // in the GraphQL operation
                for (actorIndex, actor) in (edge?.voiceActors ?? []).enumerated() where actor?.id == staff.id {
                    // Safely update the voice actor at the current index for the edge and voice actor's `isFavorite`
                    // state to if the staff member is on the current user's favorites list.
                    self.character?.media?.edges?[edgeIndex]?.voiceActors?[actorIndex]?.isFavourite = isFavorite
                }
            }
        }.store(in: &cancellables)
    }
}
