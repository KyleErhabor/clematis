//
//  GraphQLViewModel.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/14/21.
//

import Apollo
import Combine

class GraphQLViewModel {
    /// An error that occurred during some operation.
    @Published var error: GraphQLError?

    /// An array of pending cancellables.
    var cancellables = [AnyCancellable]()

    /// The completion handler for combine's `.sink(receiveCompletion:receiveValue:)` subscriber.
    ///
    /// The completion handler checks if the subscriber finished abnormally. If it did, the `error` property is set to the error so the view can handle the error
    /// accordingly (often displaying the error to the user).
    ///
    /// - Parameter completion: The completion instance.
    func completion(_ completion: Subscribers.Completion<GraphQLError>) {
        if case let .failure(err) = completion {
            self.error = err
        }
    }
}
