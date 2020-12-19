//
//  MediaEditorViewModel.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 12/11/20.
//

import Combine

class MediaEditorViewModel: ObservableObject {
    @Published var media: MediaEditorQuery.Data.Medium?

    private let id: Int

    init(id: Int) {
        self.id = id
    }

    func fetchMedia() {
        GraphQLNetwork.shared.anilist.fetch(query: MediaEditorQuery(id: id)) { result in
            switch result {
                case .success(let query):
                    if let media = query.data?.media {
                        self.media = media
                    }

                    if let errors = query.errors {
                        logger.error("\(errors)")
                    }
                case .failure(let err):
                    logger.error("\(err)")
            }
        }
    }

    func saveEntry() {
        let customLists = media?.mediaListEntry?.customLists == nil
            ? []
            : Array(media!.mediaListEntry!.customLists!.keys)

        let advancedScores = media?.mediaListEntry?.advancedScores == nil
            ? []
            : Array(media!.mediaListEntry!.advancedScores!.values) as! [Double]

        let startedAt = FuzzyDateInput(
            year: media?.mediaListEntry?.startedAt?.year,
            month: media?.mediaListEntry?.startedAt?.month,
            day: media?.mediaListEntry?.startedAt?.day
        )

        let completedAt = FuzzyDateInput(
            year: media?.mediaListEntry?.completedAt?.year,
            month: media?.mediaListEntry?.completedAt?.month,
            day: media?.mediaListEntry?.completedAt?.day
        )

        if let id = media?.mediaListEntry?.id, id != -1 {
            GraphQLNetwork.shared.anilist.perform(mutation: UpdateMediaListEntryMutation(
                id: id,
                status: media?.mediaListEntry?.status,
                score: media?.mediaListEntry?.score,
                progress: media?.mediaListEntry?.progress,
                progressVolumes: media?.mediaListEntry?.progressVolumes,
                repeat: media?.mediaListEntry?.repeat,
                priority: media?.mediaListEntry?.priority,
                private: media?.mediaListEntry?.private,
                notes: media?.mediaListEntry?.notes,
                hiddenFromStatusLists: media?.mediaListEntry?.hiddenFromStatusLists,
                customLists: customLists,
                advancedScores: advancedScores,
                startedAt: startedAt,
                completedAt: completedAt
            )) { result in
                switch result {
                    case .success(let query):
                        if let extensions = query.extensions {
                            logger.info("\(extensions)")
                        }

                        if let errors = query.errors {
                            logger.error("\(errors)")
                        }
                    case .failure(let err):
                        logger.error("\(err)")
                }
            }
        } else {
            GraphQLNetwork.shared.anilist.perform(mutation: CreateMediaListEntryMutation(
                mediaId: id,
                status: media?.mediaListEntry?.status ?? .planning,
                score: media?.mediaListEntry?.score ?? 0,
                progress: media?.mediaListEntry?.progress ?? 0,
                progressVolumes: media?.mediaListEntry?.progressVolumes ?? 0,
                repeat: media?.mediaListEntry?.repeat ?? 0,
                priority: media?.mediaListEntry?.priority ?? 0,
                private: media?.mediaListEntry?.private ?? false,
                notes: media?.mediaListEntry?.notes ?? "",
                hiddenFromStatusLists: media?.mediaListEntry?.hiddenFromStatusLists ?? false,
                customLists: customLists,
                advancedScores: advancedScores,
                startedAt: startedAt,
                completedAt: completedAt
            )) { result in
                switch result {
                    case .success(let query):
                        if let errors = query.errors {
                            logger.error("\(errors)")
                        }
                    case .failure(let err):
                        logger.error("\(err)")
                }
            }
        }
    }
}
