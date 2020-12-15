//
//  MediaEditorViewModel.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 12/11/20.
//

import Combine

class MediaEditorViewModel: ObservableObject {
    @Published private(set) var media: MediaEditorQuery.Data.Medium?

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
}
