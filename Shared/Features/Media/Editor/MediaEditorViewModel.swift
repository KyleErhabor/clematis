//
//  MediaEditorViewModel.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/15/21.
//

import Apollo
import Combine

class MediaEditorViewModel: GraphQLViewModel, ObservableObject {
    @Published var media: MediaEditorQuery.Data.Medium?
    @Published private(set) var didSave = false

    let id: Int

    init(id: Int) {
        self.id = id
    }

    func load() {
        Future<MediaEditorQuery.Data.Medium, GraphQLError> { promise in
            GraphQLNetwork.shared.fetch(query: MediaEditorQuery(id: self.id)) { result in
                switch result {
                    case let .success(query):
                        if let mediaList = query.data?.media {
                            promise(.success(mediaList))
                        }

                        if let err = query.errors?.first {
                            promise(.failure(err))
                        }
                    case let .failure(err):
                        logger.error("\(err)")
                }
            }
        }.sink(receiveCompletion: completion) { mediaList in
            self.media = mediaList
        }.store(in: &cancellables)
    }

    /// Saves all edits from the media editor.
    ///
    /// This method saves any modifications made to the `media`'s list entry data. Most fields are sent as `nil` to represent no change. Some fields may have
    /// non-nil data that represents the absense of a value (such as 0).
    ///
    /// - Score: `MediaEditorScoreView` uses a `Stepper` to increment and decrement the value. A `Stepper` cannot have a `nil` value, so the
    /// default value is `0`.
    func save() {
        let entry = media?.mediaListEntry
        let customLists: [String]? = {
            if case let .array(customLists) = entry?.customLists {
                return customLists as? [String]
            }

            return nil
        }()

        let advancedScores: [Double]? = {
            if case let .dictionary(advancedScores) = entry?.advancedScores {
                return Array(advancedScores.values) as? [Double]
            }

            return nil
        }()

        Future<Void, GraphQLError> { promise in
            GraphQLNetwork.shared.perform(mutation: CreateOrUpdateMediaListEntryMutation(
                id: entry?.id,
                mediaId: self.id,
                status: entry?.status,
                score: entry?.score == 0 ? nil : entry?.score,
                progress: entry?.progress == 0 ? nil : entry?.progress,
                progressVolumes: entry?.progressVolumes == 0 ? nil : entry?.progressVolumes,
                repeat: entry?.repeat,
                priority: entry?.priority,
                private: entry?.private,
                notes: entry?.notes,
                hiddenFromStatusLists: entry?.hiddenFromStatusLists,
                customLists: customLists,
                advancedScores: advancedScores,
                startedAt: FuzzyDateInput(
                    year: entry?.startedAt?.year,
                    month: entry?.startedAt?.month,
                    day: entry?.startedAt?.day
                ),
                completedAt: FuzzyDateInput(
                    year: entry?.completedAt?.year,
                    month: entry?.completedAt?.month,
                    day: entry?.completedAt?.day
                )
            )) { result in
                switch result {
                    case let .success(query):
                        if query.data?.saveMediaListEntry?.id != nil {
                            promise(.success(()))
                        }

                        if let err = query.errors?.first {
                            promise(.failure(err))
                        }
                    case let .failure(err):
                        logger.info("\(err)")
                }
            }
        }.sink(receiveCompletion: completion) {
            self.didSave = true
        }.store(in: &cancellables)
    }
}
