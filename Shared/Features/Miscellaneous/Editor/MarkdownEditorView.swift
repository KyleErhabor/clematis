//
//  MarkdownEditorView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/11/21.
//

import SDWebImageSwiftUI
import SwiftUI

/// A view for presenting a markdown editor.
struct MarkdownEditorView<ViewModel: MarkdownEditorViewModel>: View {
    /// A binding to the current presentation mode to dismiss the presentation programmatically.
    @Environment(\.presentationMode) private var presentationMode

    /// The global environment object for user accounts.
    @EnvironmentObject private var userStore: CurrentUserStore

    /// The view model to act on for the editor (name & saving data).
    @StateObject var viewModel: ViewModel

    /// A state detailing the current contents of the editor.
    @State var text = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Text"), footer: RulesNoticeView()) {
                    // FIXME: Focusing or trying to edit in the text field causes the app to crash.
                    TextEditor(text: $text)
                }

                if !text.isEmpty {
                    Section(header: Text("Preview")) {
                        // TODO
                    }
                }
            }.navigationTitle("\(viewModel.name) Editor")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Publish") {
                        viewModel.save(text: text)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

//struct MarkdownEditorView_Previews: PreviewProvider {
//    static var previews: some View {
//        MarkdownEditorView(viewModel: <#_#>)
//    }
//}
