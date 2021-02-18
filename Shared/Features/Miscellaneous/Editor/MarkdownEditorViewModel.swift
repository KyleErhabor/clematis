//
//  MarkdownEditorViewModel.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/11/21.
//

import Combine

/// A stub for creating a view model to create or update some content.
protocol MarkdownEditorViewModel: ObservableObject {
    /// The name of the kind of content to edit (e.g. Thread Comment).
    ///
    /// The name is used in the `.navigationTitle(_:)` modifier with "Editor" appended to it. For example, if `name` is set to "Thread Comment", "Thread
    /// Comment Editor" will be the navigation title.
    var name: String { get }

    /// Creates or updates some content.
    ///
    /// This function is called when the user hits the "Publish" confirmation button to create or update some content (a text activity, reply, thread comment, etc.)
    /// - Parameter text: The text to use for the new or existing content.
    func save(text: String)
}
