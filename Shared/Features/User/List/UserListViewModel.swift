//
//  UserListViewModel.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/20/21.
//

import Apollo
import Combine

class UserListViewModel: GraphQLViewModel, ObservableObject {
    @Published private(set) var collection: UserListQuery.Data.MediaListCollection?
    @Published var type = MediaType.anime
    @Published private var chunk = 1

    let id: Int

    init(id: Int) {
        self.id = id
    }

    func load() {
        Future<UserListQuery.Data.MediaListCollection, GraphQLError> { promise in
            GraphQLNetwork.shared.fetch(query: UserListQuery(id: self.id, type: self.type, chunk: 0)) { result in
                switch result {
                    case let .success(query):
                        if let collection = query.data?.mediaListCollection {
                            promise(.success(collection))
                        }

                        if let err = query.errors?.first {
                            promise(.failure(err))
                        }
                    case let .failure(err):
                        logger.error("\(err)")
                }
            }
        }.sink(receiveCompletion: completion) { collection in
            self.chunk = 2
            self.collection = collection
        }.store(in: &cancellables)
    }

    func delete(entry: UserListQuery.Data.MediaListCollection.List.Entry) {
        Future<Void, GraphQLError> { promise in
            GraphQLNetwork.shared.perform(mutation: DeleteMediaListEntryMutation(id: entry.id)) { result in
                switch result {
                    case let .success(query):
                        if query.data?.deleteMediaListEntry?.deleted == true {
                            promise(.success(()))
                        }

                        if let err = query.errors?.first {
                            promise(.failure(err))
                        }
                    case let .failure(err):
                        logger.error("\(err)")
                }
            }
        }.sink(receiveCompletion: completion) {
            for (index, _) in (self.collection?.lists ?? []).enumerated() {
                self.collection?.lists?[index]?.entries?.removeAll { $0?.id == entry.id }
            }
        }.store(in: &cancellables)
    }

    func progress(_ progress: Int?, in entry: UserListQuery.Data.MediaListCollection.List.Entry) {
        Future<Void, GraphQLError> { promise in
            GraphQLNetwork.shared.perform(mutation: CreateOrUpdateMediaListEntryMutation(
                id: entry.id,
                progress: progress
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
                        logger.error("\(err)")
                }
            }
        }.sink(receiveCompletion: completion) { value in
            for (listIndex, lists) in (self.collection?.lists ?? []).enumerated() {
                for (entryIndex, innerEnter) in (lists?.entries ?? []).enumerated() where innerEnter?.id == entry.id {
                    self.collection?.lists?[listIndex]?.entries?[entryIndex]?.progress = progress
                }
            }
        }.store(in: &cancellables)
    }
}
