//
//  CharacterMediaListExpandedFilterView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/14/21.
//

import SwiftUI

/// A view for displaying a sheet to filter anime/manga a character is associated with.
struct CharacterMediaListExpandedFilterView: View {
    /// The current presentation mode.
    @Environment(\.presentationMode) private var presentationMode

    /// The view model from the `CharacterView`.
    @EnvironmentObject private var viewModel: CharacterViewModel

    /// The global environment object for users.
    @EnvironmentObject private var userStore: CurrentUserStore

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Overview")) {
                    Picker("Type", selection: $viewModel.mediaType) {
                        ForEach(MediaType.allCases, id: \.rawValue) { type in
                            Text("\(type.rawValue.capitalized)")
                                .tag(type as MediaType)
                        }
                    }.pickerStyle(SegmentedPickerStyle())

                    Toggle("On My List", isOn: $viewModel.isOnList)

                    Picker("Sort", selection: $viewModel.mediaSort) {
                        // TODO: Sort by the user's preferred title rather than just English
                        Text("Title")
                            .tag(MediaSort.titleEnglishDesc)

                        Text("Format")
                            .tag(MediaSort.formatDesc)

                        Text("Newest")
                            .tag(MediaSort.startDateDesc)

                        Text("Oldest")
                            .tag(MediaSort.startDate)

                        Text("Average Score")
                            .tag(MediaSort.scoreDesc)

                        Text("Popularity")
                            .tag(MediaSort.popularityDesc)

                        Text("Episodes")
                            .tag(MediaSort.episodesDesc)

                        Text("Chapters")
                            .tag(MediaSort.chaptersDesc)

                        Text("Volumes")
                            .tag(MediaSort.volumesDesc)
                    }

                    Picker("Voice Actor Language", selection: $viewModel.voiceActorLanguage) {
                        ForEach(StaffLanguage.allCases, id: \.rawValue) { language in
                            Text("\(language.rawValue.capitalized)")
                                .tag(language as StaffLanguage?)
                        }
                    }
                }
            }.navigationTitle("Filter")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct CharacterMediaListExpandedFilterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterMediaListExpandedFilterView()
    }
}
