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
                // In `MediaEditorScoreView` and `MediaEditorAdvancedScoresView`, the views sometimes don't appear and
                // only appear upon interaction with another view. An example is when the user hits the "Set" button in
                // `MediaEditorStartDateView` and the two views immediately appear afterwards (or with an animation).
                // It seems no other view has this problem except for these two
                Section(header: Text("Overview")) {
                    MediaEditorStatusView()
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

                if hasAdvancedScores() {
                    Section(header: Text("Advanced Scores")) {
                        MediaEditorAdvancedScoresView()
                    }
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

    func hasAdvancedScores() -> Bool {
        guard let type = viewModel.media?.type else {
            return false
        }

        let names: [String?]

        switch type {
            case .anime:
                guard userStore.users.first?.mediaListOptions?.animeList?.advancedScoringEnabled == true else {
                    return false
                }

                names = userStore.users.first?.mediaListOptions?.animeList?.advancedScoring ?? []

            case .manga:
                guard userStore.users.first?.mediaListOptions?.mangaList?.advancedScoringEnabled == true else {
                    return false
                }

                names = userStore.users.first?.mediaListOptions?.mangaList?.advancedScoring ?? []
            case .__unknown:
                return false
        }

        guard case let .dictionary(advancedScores) = viewModel.media?.mediaListEntry?
                .advancedScores ?? .dictionary([:]) else {
            return false
        }

        return names.contains { name in
            //
            if let name = name {
                return advancedScores[name] != nil
            }

            return false
        }
    }
}

struct MediaEditorView_Previews: PreviewProvider {
    static var previews: some View {
        MediaEditorView(viewModel: .init(id: 302))
    }
}
