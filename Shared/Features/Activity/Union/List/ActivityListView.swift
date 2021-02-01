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
    @State private var isPresentingLikeList = false
    @State private var isPresentingListEditor = false

    var body: some View {
        HStack(alignment: .top) {
            if let media = viewModel.activity.media {
                NavigationLink(destination: MediaView(viewModel: MediaViewModel(id: media.id))) {
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
                    let creationDate = Date(timeIntervalSince1970: TimeInterval(viewModel.activity.createdAt))

                    if let media = viewModel.activity.media {
                        NavigationLink(destination: MediaView(viewModel: MediaViewModel(id: media.id))) {
                            Text("\(viewModel.activity.media?.title?.userPreferred ?? "")")
                                .font(.headline)
                        }.buttonStyle(PlainButtonStyle())
                    }

                    Spacer()

                    Text(creationDate, formatter: RelativeDateTimeFormatter())
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

                if let user = viewModel.activity.user {
                    HStack {
                        // The user avatar and name are separate navigation links to make the slight spacing in
                        // between not navigatable.
                        NavigationLink(destination: UserView(viewModel: UserViewModel(id: user.id))) {
                            WebImage(url: URL(string: "\(user.avatar?.large ?? "")"))
                                .resizable()
                                .placeholder { Color.accentColor }
                                .scaledToFill()
                                .frame(width: 32, height: 32, alignment: .top)
                                .clipped()
                                .cornerRadius(4)
                        }.animation(.default)

                        NavigationLink(destination: UserView(viewModel: UserViewModel(id: user.id))) {
                            Text("\(user.name)")
                                .fontWeight(.medium)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }

                Spacer()

                HStack {
                    let repliesViewModel = ActivityReplyListViewModel(id: viewModel.activity.id)

                    Text("") // The spacer causes the cell to look squashed without some view to push it back.

                    Spacer()

                    Button {
                        viewModel.like()
                    } label: {
                        Label("\(viewModel.activity.likeCount)",
                              systemImage: viewModel.activity.isLiked == true ? "heart.fill" : "heart")
                    }.disabled(currentUser.users.isEmpty)

                    NavigationLink(destination: ActivityReplyListView(viewModel: repliesViewModel)) {
                        Label("\(viewModel.activity.replyCount)", systemImage: "bubble.left")
                    }.disabled(viewModel.activity.isLocked ?? true) // If nil, don't bother.
                }
            }
        }.frame(height: 138)
        .contextMenu {
            ActivityListContextView(
                isPresentingLikeList: $isPresentingLikeList,
                isPresentingListEditor: $isPresentingListEditor
            )
        }.sheet(isPresented: $isPresentingLikeList) {
            ActivityListLikesView(activity: viewModel.activity)
        }.sheet(isPresented: $isPresentingListEditor) {
            if let id = viewModel.activity.media?.id {
                MediaEditorView(viewModel: MediaEditorViewModel(id: id))
            }
        }.environmentObject(viewModel)
    }
}

fileprivate struct ActivityListContextView: View {
    @EnvironmentObject private var viewModel: ActivityListViewModel
    @EnvironmentObject private var currentUser: CurrentUser
    @Binding private(set) var isPresentingLikeList: Bool
    @Binding private(set) var isPresentingListEditor: Bool

    var body: some View {
        if viewModel.activity.likes?.isEmpty == false {
            let isLiked = viewModel.activity.isLiked == true

            Button {
                isPresentingLikeList = true
            } label: {
                Label("See Likes", systemImage: "list.bullet")
            }

            Button {
                isPresentingListEditor = true
            } label: {
                Label("Open List Editor", systemImage: "pencil")
            }

            Button {
                viewModel.like()
            } label: {
                Label(isLiked ? "Unlike" : "Like", systemImage: isLiked ? "heart.fill" : "heart")
            }
        }

        if !currentUser.users.isEmpty {
            Button {
                viewModel.subscribe()
            } label: {
                let isSubscribed = viewModel.activity.isSubscribed == true

                Label(isSubscribed ? "Unsubscribe" : "Subscribe", systemImage: isSubscribed ? "bell.fill" : "bell")
            }
        }

        if viewModel.activity.user?.id == currentUser.users.first?.id {
            Menu {
                Button {
                    viewModel.delete()
                } label: {
                    Label("Delete", systemImage: "trash")
                }
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }
}

fileprivate struct ActivityListLikesView: View {
    private(set) var activity: ListActivityFragment

    var body: some View {
        NavigationView {
            List(activity.likes?.compactMap { $0 } ?? [], id: \.id) { user in
                NavigationLink(destination: UserView(viewModel: UserViewModel(id: user.id))) {
                    WebImage(url: URL(string: "\(user.avatar?.large ?? "")"))
                        .resizable()
                        .placeholder { Color.accentColor }
                        .scaledToFill()
                        .frame(width: 32, height: 32, alignment: .top)
                        .clipped()
                        .cornerRadius(4)

                    Text("\(user.name)")
                        .font(.headline)
                }.animation(.default)
            }.navigationTitle("Likes")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ActivityListView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityListView(viewModel: ActivityListViewModel(activity: ListActivityFragment(
            id: -1,
            status: "read chapter",
            isLiked: false,
            isLocked: false,
            progress: "6 - 11",
            createdAt: Int(Date().timeIntervalSince1970),
            likeCount: 1,
            replyCount: 1,
            isSubscribed: true,
            likes: [.init(id: 764252, name: "SongSangwoo")],
            user: .init(id: 164560, name: "LiteLT"),
            media: .init(id: 72001, title: .init(userPreferred: "Song of the Long March"))
        )))
    }
}
