//
//  MediaViewModel.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 12/20/20.
//

import Foundation

class MediaViewModel: ObservableObject {
    @Published private(set) var media: MediaQuery.Data.Medium?

    private let id: Int

    init(id: Int) {
        self.id = id
    }

    func fetchMedia() {
        GraphQLNetwork.shared.anilist.fetch(query: MediaQuery(id: id)) { result in
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
}
