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
        ScrollView {
            MediaHeaderView()

            Group {
                MediaSummaryView(isPresenting: $isPresenting)
                Divider()

                if let updatedAt = viewModel.media?.updatedAt {
                    HStack {
                        Spacer()

                        Text("Last Updated ").bold()
                            + Text(Date(timeIntervalSince1970: TimeInterval(updatedAt)),
                                   formatter: RelativeDateTimeFormatter())
                    }.padding()
                    .font(.footnote)
                    .foregroundColor(.secondary)
                }
            }.offset(y: -100)
        }.environmentObject(viewModel)
        .navigationTitle("\(viewModel.media?.title?.userPreferred ?? "")")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(.all, edges: [.top, .horizontal])
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
}
