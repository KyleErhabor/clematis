//
//  MediaEditorView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/15/21.
//

import SwiftUI

struct MediaEditorView: View {
    @Environment(\.presentationMode) private var presentationMode
    @StateObject var viewModel: MediaEditorViewModel

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Overview")) {
                    MediaEditorStatusView()
                    MediaEditorScoreView()
                    MediaEditorAdvancedScoresView()
                }

                Section(header: Text("Progress"), footer: MediaEditorProgressFooterView()) {
                    MediaEditorProgressView()
                    MediaEditorProgressVolumesView()
                    MediaEditorRepeatView()
                    MediaEditorPriorityView()
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
