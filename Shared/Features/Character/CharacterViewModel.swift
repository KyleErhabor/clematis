//
//  CharacterViewModel.swift
//  Amincapp (iOS)
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

    /// If to filter for media on the current user's list.
    ///
    /// Defaults to `nil`.
    @Published var isOnList = false

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
                mediaSort: [self.mediaSort]
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
                mediaSort: [self.mediaSort]
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

    @available(*, deprecated, message: "Use `nextMedia()` instead.")
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
}
