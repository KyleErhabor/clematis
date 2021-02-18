//
//  MediaEditorView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/15/21.
//

import SwiftUI

struct MediaEditorView: View {
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject private var userStore: CurrentUserStore
    @StateObject var viewModel: MediaEditorViewModel

    var body: some View {
        NavigationView {
            Form {
                // TODO: Add advanced scores support.
                Section(header: Text("Overview")) {
                    MediaEditorStatusView()

                    // FIXME: This class may not be visible to the user sometimes. The view must be reloaded for it to
                    // be visible, but it should always be visible. This is not caused by the conditional statements
                    // within the view.
                    MediaEditorScoreView()
                }

                Section(header: Text("Progress"), footer: MediaEditorProgressFooterView()) {
                    MediaEditorProgressView()
                    MediaEditorProgressVolumesView()
                    MediaEditorRepeatView()
                    MediaEditorPriorityView()
                    MediaEditorStartDateView()
                    MediaEditorCompletedDateView()
                }

                Section(header: Text("Notes")) {
                    MediaEditorNotesView()
                }

                if case let .dictionary(lists) = viewModel.media?.mediaListEntry?.customLists, !lists.isEmpty {
                    Section(header: Text("Custom Lists")) {
                        MediaEditorCustomListsView()
                    }
                }

                Section(header: Text("List Scope"), footer: MediaEditorListScopeFooterView()) {
                    MediaEditorPrivateView()
                    MediaEditorHiddenFromStatusListView()
                }

                Section(footer: MediaEditorFooterView()) {}
            }.navigationTitle("List Editor")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.save()
                    }
                }
            }
        }.alert(item: $viewModel.error) { err in
            Alert(
                title: Text("Error"),
                message: Text("\(err.message ?? "An unknown error has occurred.")"),
                dismissButton: .default(Text("OK"))
            )
        }.environmentObject(viewModel)
        .onChange(of: viewModel.didSave) { didSave in
            if didSave {
                presentationMode.wrappedValue.dismiss()
            }
        }.onAppear {
            viewModel.load()
        }
    }
}

struct MediaEditorView_Previews: PreviewProvider {
    static var previews: some View {
        MediaEditorView(viewModel: .init(id: 302))
    }
}
