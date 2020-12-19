//
//  ActivityListKindView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 12/6/20.
//

import SDWebImageSwiftUI
import SwiftUI

struct ActivityListKindView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @EnvironmentObject private var viewModel: ActivityFeedViewModel
    @State private var error: AniList.ErrorKind?
    @State private var isPresenting = false

    private(set) var activity: ListActivityFragment

    private let dateFormatter: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full

        return formatter
    }()

    var body: some View {
        HStack {
            NavigationLink(destination: MediaView()) {
                WebImage(url: URL(string: activity.media?.coverImage?.extraLarge ?? ""))
                    .resizable()
                    .placeholder {
                        if let coverImageColor = activity.media?.coverImage?.color {
                            Color(hex: Int(coverImageColor.dropFirst(), radix: 16)!)
                        } else {
                            Color.accentColor
                        }
                    }.frame(width: 90, height: 135)
                    .cornerRadius(8)
            }

            VStack(alignment: .leading) {
                HStack(alignment: .firstTextBaseline) {
                    NavigationLink(destination: MediaView()) {
                        Text(activity.media?.title?.userPreferred ?? "?")
                            .bold()
                            .lineLimit(2)
                    }.buttonStyle(PlainButtonStyle())

                    Spacer()

                    Text(dateFormatter.localizedString(
                        for: Date(timeIntervalSince1970: TimeInterval(activity.createdAt)),
                        relativeTo: Date()
                    )).font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                }

                let status = activity.status?.capitalizeFirstLetter() ?? "?"

                if let progress = activity.progress {
                    Text("\(status) \(progress)")
                } else {
                    Text("\(status)")
                }

                if let user = activity.user {
                    NavigationLink(destination: UserView()) {
                        WebImage(url: URL(string: user.avatar?.large ?? ""))
                            .resizable()
                            .placeholder { Color.accentColor }
                            .scaledToFill()
                            .frame(width: 36, height: 36)
                            .cornerRadius(8)

                        Text(user.name)
                            .fontWeight(.medium)
                    }
                }

                Spacer()

                HStack {
                    Text("") // NOTE: Find an alternative for allocating a small amount of space to balance space.
                    Spacer()

                    Button {
                        like()
                    } label: {
                        Label("\(activity.likeCount)", systemImage: activity.isLiked == true ? "heart.fill" : "heart")
                            .foregroundColor(.accentColor)
                    }

                    // FIXME: https://github.com/LiteLT/Amincapp-Apple/issues/2
                    Label("\(activity.replyCount)", systemImage: "bubble.left")
                        .foregroundColor(.accentColor)
                }
            }
        }.contextMenu {
            let isSubscribed = activity.isSubscribed ?? false

            Button {
                if currentUser.users.isEmpty {
                    error = .unauthorized
                } else {
                    isPresenting = true
                }
            } label: {
                Label("Open List Editor", systemImage: "slider.horizontal.3")
            }

            Button {
                like()
            } label: {
                let liked = activity.isLiked ?? false

                Label(liked ? "Unlike" : "Like", systemImage: liked ? "heart.fill" : "heart")
                    .foregroundColor(.accentColor)
            }

            Button {
                if currentUser.users.isEmpty {
                    error = .unauthorized
                } else {
                    viewModel.subscribe(id: activity.id, subscribe: !isSubscribed)
                }
            } label: {
                Label(isSubscribed ? "Unsubscribe" : "Subscribe", systemImage: isSubscribed ? "bell.fill" : "bell")
            }
        }.alert(item: $error) { err in
            Alert(title: Text(err.message()))
        }.sheet(isPresented: $isPresenting) {
            MediaEditorView(viewModel: MediaEditorViewModel(id: activity.media!.id))
                .environmentObject(currentUser)
        }
    }

    func like() {
        if currentUser.users.isEmpty {
            error = .unauthorized
        } else {
            viewModel.like(id: activity.id, type: .activity)
        }
    }
}

struct ActivityListKindView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityListKindView(activity: ListActivityFragment(
            id: 1,
            createdAt: Int(Date().timeIntervalSince1970) * 1000,
            likeCount: 10,
            replyCount: 3
        ))
    }
}
