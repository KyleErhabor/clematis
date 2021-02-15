//
//  ActivityListView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/31/21.
//

import SDWebImageSwiftUI
import SwiftUI

/// A view for displaying a list activity (`ListActivityFragment`)
struct ActivityListView: View {
    /// The global environment object for user accounts logged in.
    @EnvironmentObject private var userStore: CurrentUserStore

    /// The view model for this list activity.
    @StateObject var viewModel: ActivityListViewModel

    /// A state detailing what sheet to present.
    @State private var sheet: ActivityListViewSheet?

    /// A state detailing what alert to present.
    @State private var alert: ActivityListViewAlert?

    var body: some View {
        HStack {
            if let media = viewModel.activity.media {
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
                        .frame(width: 92)
                        .clipped()
                        .cornerRadius(4)
                }.animation(.default)
                .alert(item: $viewModel.error) { err in
                    Alert(
                        title: Text("Error"),
                        message: Text("\(err.message ?? "An unknown error has occurred.")"),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }

            VStack(alignment: .leading) {
                HStack(alignment: .firstTextBaseline) {
                    let creationDate = Date(timeIntervalSince1970: .init(viewModel.activity.createdAt))

                    if let media = viewModel.activity.media {
                        NavigationLink(destination: MediaView(viewModel: .init(id: media.id))) {
                            Text("\(viewModel.activity.media?.title?.userPreferred ?? "")")
                                .font(.headline)
                        }.buttonStyle(PlainButtonStyle())
                    }

                    Spacer()

                    Text("\(creationDate, formatter: RelativeDateTimeFormatter())")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                if let status = viewModel.activity.status {
                    if let progress = viewModel.activity.progress {
                        Text("\(status.capitalizeFirstLetter()) \(progress)")
                    } else {
                        Text("\(status.capitalizeFirstLetter())")
                    }
                }

                if let user = viewModel.activity.user?.fragments.userPreviewFragment {
                    UserPreviewView(user: user)
                }

                Spacer()

                HStack {
                    // NOTE: `Spacer(minLength:)` does not respect the spacing between views for
                    // `VStack(alignment:spacing:content:)`. Placing a `Text(_:)` before the spacer allows the spacer
                    // to allocate some space to prevent the spacer from getting too close to the media cover image.
                    Text("")

                    Spacer()

                    Button {
                        viewModel.like()
                    } label: {
                        let isLiked = viewModel.activity.isLiked == true

                        Label("\(viewModel.activity.likeCount)", systemImage: isLiked ? "heart.fill" : "heart")
                    }

                    NavigationLink(destination: ActivityReplyListView(viewModel: .init(id: viewModel.activity.id))) {
                        Label("\(viewModel.activity.replyCount)", systemImage: "bubble.left")
                    }
                }
            }.alert(item: $alert) { alert in
                switch alert {
                    case .activityDeletion:
                        return Alert(
                            title: Text("Are you sure you want to delete this activity?"),
                            message: Text("This action cannot be undone."),
                            primaryButton: .destructive(Text("Delete")) {
                                viewModel.delete()
                            },
                            secondaryButton: .cancel()
                        )
                    case .mediaLocked:
                        return Alert(
                            title: Text("Anime/Manga Locked"),
                            message: Text("This anime/manga is locked and cannot be added to lists."),
                            dismissButton: .default(Text("OK"))
                        )
                }
            }
        }.frame(height: 138)
        .contextMenu {
            ActivityListContextView(sheet: $sheet, alert: $alert)
        }.sheet(item: $sheet) { sheet in
            switch sheet {
                case .likes:
                    let users = viewModel.activity.likes?.compactMap { $0?.fragments.userPreviewFragment } ?? []

                    LikeNavigationView(users: users)
                case .listEditor:
                    if let id = viewModel.activity.media?.id {
                        MediaEditorView(viewModel: .init(id: id))
                            .environmentObject(userStore)
                    }
            }
        }.environmentObject(viewModel)
    }
}

/// The context menu controls for the `ActivityListView` view.
fileprivate struct ActivityListContextView: View {
    /// The view model from the parent `ActivityListView` view.
    @EnvironmentObject private var viewModel: ActivityListViewModel

    /// The global environment object for user accounts logged in.
    @EnvironmentObject private var userStore: CurrentUserStore

    /// A binding detailing what sheet to present.
    @Binding var sheet: ActivityListViewSheet?

    /// A binding detailing what alert to present.
    @Binding var alert: ActivityListViewAlert?

    var body: some View {
        // FIXME: We can't use a button that presents an sheet for creating or editing a reply because it always causes
        // the app to crash.
        if userStore.isSignedIn {
            Button {
                if viewModel.activity.media?.isLocked == true {
                    alert = .mediaLocked
                } else {
                    sheet = .listEditor
                }
            } label: {
                Label("Open List Editor", systemImage: "pencil")
            }
        }

        if viewModel.activity.likes?.isEmpty == false {
            Button {
                sheet = .likes
            } label: {
                Label("See Likes", systemImage: "list.bullet")
            }
        }

        if userStore.isSignedIn {
            Button {
                viewModel.subscribe()
            } label: {
                let isSubscribed = viewModel.activity.isSubscribed == true

                Label(isSubscribed ? "Unsubscribe" : "Subscribe", systemImage: isSubscribed ? "bell.fill" : "bell")
            }
        }

        if userStore.users.first?.id == viewModel.activity.user?.fragments.userPreviewFragment.id {
            Button {
                alert = .activityDeletion
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }
}

/// An enum for what kind of alert to present.
fileprivate enum ActivityListViewAlert: Int, Identifiable {
    /// Prompt the user to confirm if they wish to delete the activity.
    case activityDeletion

    /// Deny the user permission to add this anime/manga to their list due to it being locked and pending deletion.
    case mediaLocked

    var id: Int { rawValue }
}

/// An enum for what kind of sheet to present.
fileprivate enum ActivityListViewSheet: Int, Identifiable {
    /// A sheet detailing all the users who liked the activity.
    case likes

    /// A sheet for the user to add, modify, or delete the anime/manga this activity references on/from their list.
    case listEditor

    var id: Int { rawValue }
}

struct ActivityListView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityListView(viewModel: .init(activity: .init(
            id: 172596430,
            status: "watched episode",
            isLiked: false,
            isLocked: false,
            progress: "5 - 10",
            createdAt: Int(Date().timeIntervalSince1970),
            likeCount: 41,
            replyCount: 1,
            isSubscribed: false,
            user: .init(unsafeResultMap: UserPreviewFragment(
                id: 120834,
                name: "oyushi"
            ).resultMap),
            likes: [],
            media: .init(
                id: 101,
                type: .anime,
                isLocked: false,
                title: .init(userPreferred: "Air")
            )
        )))
    }
}
