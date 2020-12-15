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
        // NOTE: SwiftUI may crash due to the CurrentUser environment variable not being found in the
        // environment. The presentation mode will say the view is no longer presenting, but it is to the user. The
        // source of this issue has yet to be found, but it happening is rare. It could happen due to inactivity from
        // the user, moving a Slider too quickly (the cursor going off-screen and on-screen), and other arbitrary
        // reasons unknown at the time of writing this.
        VStack {
            if let media = viewModel.media {
                let entry = media.mediaListEntry

                let customList = entry?.customLists == nil
                    ? []
                    : Array(entry!.customLists!.filter { $0.value as! Bool }.keys)

                let advancedScores: [Double] = {
                    // advancedScores will be nil if the user hasn't added this entry to any custom lists`.
                    if let scores = entry?.advancedScores {
                        return Array(scores.values) as! [Double]
                    }

                    if media.type == .anime {
                        let times = currentUser.user!.mediaListOptions!.animeList!.advancedScoring!.count

                        return Array(repeating: 0, count: times)
                    }

                    let times = currentUser.user!.mediaListOptions!.mangaList!.advancedScoring!.count

                    return Array(repeating: 0, count: times)
                }()

                MediaEditorFormView(
                    note: entry?.notes ?? "",
                    status: entry?.status ?? .planning,
                    score: entry?.score ?? 0,
                    repeats: entry?.repeat ?? 0,
                    isPrivate: entry?.private ?? false,
                    progress: entry?.progress ?? 0,
                    customList: customList,
                    advancedScores: advancedScores,
                    volumes: entry?.progressVolumes ?? 0,
                    media: media
                )
            } else {
                NavigationView {
                    ProgressView()
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
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
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject private var currentUser: CurrentUser

    @State private(set) var note: String
    @State private(set) var status: MediaListStatus
    @State private(set) var score: Double
    @State private(set) var repeats: Int
    @State private(set) var isPrivate: Bool
    @State private(set) var progress: Int
    @State private(set) var customList: [String]
    @State private(set) var advancedScores: [Double]
    @State private(set) var volumes: Int

    private(set) var media: MediaEditorQuery.Data.Medium

    private let dateFormatter: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full

        return formatter
    }()

    var body: some View {
        NavigationView {
            Form {
                let listOptions = currentUser.user!.mediaListOptions!

                Section(header: Text("Overview")) {
                    MediaEditorFormOverviewView(status: $status, score: $score, media: media)
                }

                Section(header: Text("Progress")) {
                    MediaEditorFormProgressView(
                        repeats: $repeats,
                        progress: $progress,
                        volumes: $volumes,
                        status: $status,
                        media: media
                    )
                }

                if let scoreFormat = listOptions.scoreFormat {
                    if scoreFormat == .point_10Decimal || scoreFormat == .point_100 {
                        if media.type == .anime {
                            if listOptions.animeList!.advancedScoringEnabled == true {
                                Section(header: Text("Advanced Scores")) {
                                    MediaEditorFormAdvancedScoresView(advancedScores: $advancedScores, media: media)
                                }
                            }
                        } else {
                            if listOptions.mangaList!.advancedScoringEnabled == true {
                                Section(header: Text("Advanced Scores")) {
                                    MediaEditorFormAdvancedScoresView(advancedScores: $advancedScores, media: media)
                                }
                            }
                        }
                    }
                }

                // NOTE: Using `else if` causes the Swift compiler to choke and fail to type-check in reasonable time.
                if media.type == .anime && listOptions.animeList!.customLists!.count > 0 {
                    Section(header: Text("Custom Lists")) {
                        MediaEditorFormCustomListView(list: $customList, media: media)
                    }
                }

                if media.type == .manga && listOptions.mangaList!.customLists!.count > 0 {
                    Section(header: Text("Custom Lists")) {
                        MediaEditorFormCustomListView(list: $customList, media: media)
                    }
                }

                Section(header: Text("Notes")) {
                    TextEditor(text: $note)
                }

                Section(footer: HStack {
                    if let lastUpdate = media.mediaListEntry?.updatedAt {
                        let lastUpdateDate = Date(timeIntervalSince1970: TimeInterval(lastUpdate))
                        let relativeTime = dateFormatter.localizedString(
                            for: lastUpdateDate,
                            relativeTo: Date()
                        )

                        Spacer()
                        Text("Last Updated: ").bold() + Text(relativeTime)
                    }
                }.padding()) {
                    Toggle("Private", isOn: $isPrivate)
                }
            }.navigationTitle("List Editor")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Dismiss") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // TODO: Save the data
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct MediaEditorView_Previews: PreviewProvider {
    static var previews: some View {
        MediaEditorView(viewModel: MediaEditorViewModel(id: 30009))
    }
}
