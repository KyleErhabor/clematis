//
//  UserListContentView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/20/21.
//

import SDWebImageSwiftUI
import SwiftUI

/// A view for displaying a media list collection entry.
///
/// A media list collection entry is an anime/manga the user has added to their list. The view displays a preview of the anime/manga and the list entry data, like the
/// progress and how much until it can be marked as completed.
///
/// - Attention: On the website, a user can set the list theme. The three main themes are `cards`, `list`, and `list-compact`.
///     - `cards`: The anime/manga image is clearly visible with the name, score, and progress on the bottom edge.
///     - `list`: The image is small and the name, score, and progress is widely spaced out.
///     - `list-compact` The same as `list` but smaller and no image is set.
///
/// The `MediaListTypeOptions.theme` property in the GraphQL API holds the value, but is returned as `Json`. It's been marked as deprecated since it can
/// change at any time without warning. No theming has been implemented because of this, but if it's ever stabilized, this view may be rewritten and broken up into
/// separate sub-views.
struct UserListContentView: View {
    /// The view model from the `UserListView`.
    @EnvironmentObject private var viewModel: UserListViewModel

    /// The global environment object for user accounts.
    @EnvironmentObject private var userStore: CurrentUserStore

    /// A state indicating when to present the confirmation alert to delete the list entry.
    @State private var alert = false

    /// A state indicating when to present the media list editor for this list entry.
    @State private var sheet = false

    /// The list entry for this view.
    private let entry: UserListQuery.Data.MediaListCollection.List.Entry

    var body: some View {
        HStack {
            if let media = entry.media {
                NavigationLink(destination: MediaView(viewModel: .init(id: media.id))) {
                    WebImage(url: URL(string: "\(media.coverImage?.extraLarge ?? "")"))
                        .resizable()
                        .placeholder {
                            if let hex = media.coverImage?.color,
                               let color = Int("\(hex)", radix: 16) {
                                Color(hex: color)
                            } else {
                                Color.accentColor
                            }
                        }.scaledToFill()
                        .frame(width: 80)
                        .clipped()
                        .cornerRadius(4)
                }.animation(.default)
            }

            VStack(alignment: .leading) {
                HStack(alignment: .firstTextBaseline) {
                    if let media = entry.media {
                        NavigationLink(destination: MediaView(viewModel: .init(id: media.id))) {
                            Text("\(media.title?.userPreferred ?? "")")
                                .font(.headline)
                        }.buttonStyle(PlainButtonStyle())
                    }

                    Spacer()

                    Button {
                        sheet = true
                    } label: {
                        Label("Edit", systemImage: "pencil")
                    }.font(.callout)
                }

                Spacer()

                UserListContentProgressView(entry: entry)
            }
        }.frame(height: 120)
        .contextMenu {
            UserListContentContextView(alert: $alert, sheet: $sheet, entry: entry)
        }.alert(isPresented: $alert) {
            Alert(
                title: Text("Are you sure you want to delete this list entry?"),
                message: Text("This action cannot be undone."),
                primaryButton: .destructive(Text("Delete")) {
                    viewModel.delete(entry: entry)
                },
                secondaryButton: .cancel()
            )
        }.sheet(isPresented: $sheet) {
            if let media = entry.media {
                MediaEditorView(viewModel: MediaEditorViewModel(id: media.id))
                    .environmentObject(userStore)
            }
        }
    }

    /// Initializes the view
    /// - Parameter entry: The list entry for this view.
    init(entry: UserListQuery.Data.MediaListCollection.List.Entry) {
        self.entry = entry
    }
}

//struct UserListContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserListCellView()
//    }
//}
