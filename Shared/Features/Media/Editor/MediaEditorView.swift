//
//  MediaEditorView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 12/10/20.
//

import SDWebImageSwiftUI
import SwiftUI

struct MediaEditorView: View {
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject private var currentUser: CurrentUser
    @StateObject var viewModel: MediaEditorViewModel

    var body: some View {
        VStack {
            #if os(macOS)
            let toolbarPlacement = ToolbarItemPlacement.navigation

            #else
            let toolbarPlacement = ToolbarItemPlacement.navigationBarLeading

            #endif

            if viewModel.media != nil {
                NavigationView {
                    MediaEditorFormView()
                        .navigationTitle("List Editor")
                        .toolbar {
                            ToolbarItem(placement: toolbarPlacement) {
                                Button("Dismiss") {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            }

                            ToolbarItem(placement: toolbarPlacement) {
                                Button("Save") {
                                    viewModel.saveEntry()
                                    presentationMode.wrappedValue.dismiss()
                                }
                            }
                        }
                }
            } else {
                NavigationView {
                    ProgressView()
                        .toolbar {
                            ToolbarItem(placement: toolbarPlacement) {
                                Button("Dismiss") {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            }
                        }
                }
            }
        }.environmentObject(viewModel)
        .onAppear {
            viewModel.fetchMedia()
        }
    }
}

fileprivate struct MediaEditorFormView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel
    @EnvironmentObject private var currentUser: CurrentUser

    private let dateFormatter: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full

        return formatter
    }()

    var body: some View {
        Form {
            let media = viewModel.media!
            let listOptions = currentUser.users[0].mediaListOptions!

            Section(header: Text("Overview")) {
                MediaEditorFormOverviewView()
            }.animation(.default)

            Section(header: Text("Progress")) {
                MediaEditorFormProgressView()
            }.animation(.default)

            if let scoreFormat = listOptions.scoreFormat {
                if scoreFormat == .point_10Decimal || scoreFormat == .point_100 {
                    let animeList = listOptions.animeList!

                    if media.type == .anime && animeList.advancedScoringEnabled == true
                        && !animeList.advancedScoring!.isEmpty {
                        Section(header: Text("Advanced Scores")) {
                            MediaEditorFormAdvancedScoresView()
                        }.animation(.default)
                    }

                    let mangaList = listOptions.mangaList!

                    if media.type == .manga && mangaList.advancedScoringEnabled == true
                        && !mangaList.advancedScoring!.isEmpty {
                        Section(header: Text("Advanced Scores")) {
                            MediaEditorFormAdvancedScoresView()
                        }.animation(.default)
                    }
                }
            }

            // Using `else if` instead of a seprate `if` causes the Swift compiler to choke (type-checking in
            // reasonable time error).
            if media.type == .anime && !listOptions.animeList!.customLists!.isEmpty {
                Section(header: Text("Custom Lists")) {
                    MediaEditorFormCustomListView()
                }.animation(.default)
            }

            if media.type == .manga && !listOptions.mangaList!.customLists!.isEmpty {
                Section(header: Text("Custom Lists")) {
                    MediaEditorFormCustomListView()
                }.animation(.default)
            }

            Section(header: Text("Notes")) {
                MediaEditorFormNotesView()
            }.animation(.default)

            Section(header: Text("List Settings"), footer: HStack {
                if let lastUpdate = media.mediaListEntry?.updatedAt {
                    let lastUpdateDate = Date(timeIntervalSince1970: TimeInterval(lastUpdate))
                    let relativeTime = dateFormatter.localizedString(for: lastUpdateDate, relativeTo: Date())

                    Spacer()
                    Text("Last Updated: ").bold() + Text(relativeTime)
                }
            }.padding()) {
                MediaEditorFormListSettingsView()
            }.animation(.default)
        }
    }
}

struct MediaEditorView_Previews: PreviewProvider {
    static var previews: some View {
        MediaEditorView(viewModel: MediaEditorViewModel(id: 30009))
    }
}
