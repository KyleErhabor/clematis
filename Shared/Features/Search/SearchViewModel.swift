//
//  SearchViewModel.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/17/21.
//

import Apollo
import Combine

class SearchViewModel: GraphQLViewModel, ObservableObject {
    @Published private(set) var fields: SearchQuery.Data?

    func search(for search: String) {
        Future<SearchQuery.Data, GraphQLError> { promise in
            GraphQLNetwork.shared.fetch(query: SearchQuery(search: search)) { result in
                switch result {
                    case let .success(query):
                        if let data = query.data {
                            promise(.success(data))
                        }

                        if let err = query.errors?.first {
                            promise(.failure(err))
                        }
                    case let .failure(err):
                        logger.error("\(err)")
                }
            }
        }.sink(receiveCompletion: completion) { data in
            self.fields = data
        }.store(in: &cancellables)
    }
}

enum SearchViewTab {
    case browse
    case search
}
