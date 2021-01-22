//
//  MediaView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 11/23/20.
//

import SwiftUI

struct MediaView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @StateObject var viewModel: MediaViewModel
    @State private var isPresenting = false

    var body: some View {
        // NOTE: ScrollView does not allow us to use `.ignoresSafeArea()` unless we use it on the entire ScrollView,
        // which is not what we want since it'll lead to spacing issues for other views that should rely on the safe
        // area. The banner image and a few horizontal scrollers will appear a bit wacky when in landscape mode.
        ScrollView {
            MediaHeaderView()

            VStack(alignment: .leading) {
                MediaSummaryView(isPresenting: $isPresenting) // Padding applied internally
                Divider().padding()

                if viewModel.media?.relations?.edges?.isEmpty == false {
                    MediaRelationsView().padding(.horizontal)
                }

                if viewModel.media?.characters?.edges?.isEmpty == false {
                    MediaCharactersView().padding(.horizontal)
                }

                if viewModel.media?.staff?.edges?.isEmpty == false {
                    MediaStaffListView().padding(.horizontal)
                }

                if hasStats() {
                    MediaStatsView().padding(.horizontal)
                    Divider().padding()
                }

                MediaPropertiesView().padding(.horizontal)

                if let updatedAt = viewModel.media?.updatedAt {
                    HStack {
                        Spacer()

                        Text("Last Updated ").bold()
                            + Text(Date(timeIntervalSince1970: TimeInterval(updatedAt)),
                                   formatter: RelativeDateTimeFormatter())
                    }.padding()
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .animation(.default)
                }
            }.offset(y: -156)
        }.environmentObject(viewModel)
        .navigationTitle("\(viewModel.media?.title?.userPreferred ?? "")")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isPresenting = true
                } label: {
                    Image(systemName: "pencil.circle")
                }
            }
        }.onAppear {
            viewModel.fetchMedia()
        }.sheet(isPresented: $isPresenting) {
            MediaEditorView(viewModel: MediaEditorViewModel(id: viewModel.id))
                .environmentObject(currentUser)
        }
    }

    func hasStats() -> Bool {
        if viewModel.media?.stats?.scoreDistribution?.isEmpty == false {
            return true
        }

//        if viewModel.media?.stats?.statusDistribution?.contains(where: { $0?.amount ?? 0 > 0 }) == true {
//            return true
//        }

        return false
    }
}
