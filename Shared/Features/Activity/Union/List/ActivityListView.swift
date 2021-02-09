//
//  ActivityListView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/31/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct ActivityListView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @StateObject var viewModel: ActivityListViewModel
    @State private var presentedSheet: ActivityListViewSheet?
    @State private var presentedAlert: ActivityListViewAlert?

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
            }
        }.frame(height: 138)
        .contextMenu {
            ActivityListContextView(presentedSheet: $presentedSheet, presentedAlert: $presentedAlert)
        }.alert(item: $presentedAlert) { alert in
            switch alert {
                case .deleteConfirmation:
                    return Alert(
                        title: Text("Are you sure you want to delete this activity?"),
                        message: Text("This action cannot be undone."),
                        primaryButton: .destructive(Text("Delete")) {
                            viewModel.delete()
                        },
                        secondaryButton: .cancel()
                    )
                case .errorAccountListEditor:
                    return Alert(
                        title: Text("Account Required"),
                        message: Text("You must sign in to add or modify this anime/manga on your list."),
                        primaryButton: .default(Text("Sign In")) {
                            logger.info("Signing in...")
                        },
                        secondaryButton: .cancel()
                    )
                case .errorAccountReply:
                    return Alert(
                        title: Text("Account Required"),
                        message: Text("You must sign in to add a reply to an activity."),
                        primaryButton: .default(Text("Sign In")) {
                            logger.info("Signing in...")
                        },
                        secondaryButton: .cancel()
                    )
                case .errorMediaLocked:
                    return Alert(
                        title: Text("Anime/Manga Locked"),
                        message: Text("This anime/manga is locked and cannot be added to lists."),
                        dismissButton: .cancel()
                    )
                case .errorReplyLocked:
                    return Alert(
                        title: Text("Activity Locked"),
                        message: Text("This activity is locked and cannot receive new replies."),
                        dismissButton: .cancel()
                    )
            }
        }.sheet(item: $presentedSheet) { sheet in
            switch sheet {
                case .likes:
                    let users = viewModel.activity.likes?.compactMap { $0?.fragments.userPreviewFragment } ?? []

                    LikeNavigationView(users: users)
                        .environmentObject(currentUser)
                case .listEditor:
                    if let id = viewModel.activity.media?.id {
                        MediaEditorView(viewModel: .init(id: id))
                            .environmentObject(currentUser)
                    }
                case .reply:
                    ActivityReplyEditorView()
            }
        }.environmentObject(viewModel)
    }
}

fileprivate struct ActivityListContextView: View {
    @EnvironmentObject private var viewModel: ActivityListViewModel
    @EnvironmentObject private var currentUser: CurrentUser
    @Binding var presentedSheet: ActivityListViewSheet?
    @Binding var presentedAlert: ActivityListViewAlert?

    var body: some View {
        Button {
            if currentUser.users.first == nil {
                presentedAlert = .errorAccountReply
            } else if viewModel.activity.isLocked == true {
                presentedAlert = .errorReplyLocked
            } else {
                presentedSheet = .reply
            }
        } label: {
            Label("Reply", systemImage: "arrowshape.turn.up.left")
        }

        Button {
            if currentUser.users.first == nil {
                presentedAlert = .errorAccountListEditor
            } else if viewModel.activity.media?.isLocked == true {
                presentedAlert = .errorMediaLocked
            } else {
                presentedSheet = .listEditor
            }
        } label: {
            Label("Open List Editor", systemImage: "pencil")
        }

        if (viewModel.activity.likes?.count ?? 0) > 0 {
            Button {
                presentedSheet = .likes
            } label: {
                Label("See Likes", systemImage: "list.bullet")
            }
        }

        Button {
            viewModel.subscribe()
        } label: {
            let isSubscribed = viewModel.activity.isSubscribed == true

            Label(isSubscribed ? "Unsubscribe" : "Subscribe", systemImage: isSubscribed ? "bell.fill" : "bell")
        }

        if currentUser.users.first?.id == viewModel.activity.user?.fragments.userPreviewFragment.id {
            Button {
                presentedAlert = .deleteConfirmation
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }
}

fileprivate enum ActivityListViewAlert: Int, Identifiable {
    case deleteConfirmation
    case errorAccountListEditor
    case errorAccountReply
    case errorMediaLocked
    case errorReplyLocked

    var id: Int { rawValue }
}

fileprivate enum ActivityListViewSheet: Int, Identifiable {
    case likes
    case listEditor
    case reply

    var id: Int { rawValue }
}

//struct ActivityListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityListView(viewModel: ActivityListViewModel(activity: ListActivityFragment(
//            id: -1,
//            status: "read chapter",
//            isLiked: false,
//            isLocked: false,
//            progress: "6 - 11",
//            createdAt: Int(Date().timeIntervalSince1970),
//            likeCount: 1,
//            replyCount: 1,
//            isSubscribed: true,
//            likes: [.init(id: 764252, name: "SongSangwoo")],
//            user: .init(id: 164560, name: "LiteLT"),
//            media: .init(id: 72001, title: .init(userPreferred: "Song of the Long March"))
//        )))
//    }
//}
