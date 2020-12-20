//
//  ActivityTextKindView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 12/9/20.
//

import SDWebImageSwiftUI
import SwiftUI

struct ActivityTextKindView: View {
    @EnvironmentObject private var viewModel: ActivityFeedViewModel
    @EnvironmentObject private var currentUser: CurrentUser
    @State private var error: AniList.ErrorKind?
    @State private var isPresentingDeleteNotice = false

    private(set) var activity: TextActivityFragment

    private let dateFormatter: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full

        return formatter
    }()

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                NavigationLink(destination: UserView()) {
                    WebImage(url: URL(string: activity.user?.avatar?.large ?? ""))
                        .resizable()
                        .placeholder { Color.accentColor }
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .cornerRadius(8)

                    Text(activity.user?.name ?? "?")
                        .fontWeight(.medium)
                }

                Spacer()

                Text(dateFormatter.localizedString(
                    for: Date(timeIntervalSince1970: TimeInterval(activity.createdAt)),
                    relativeTo: Date()
                )).font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            }

            // FIXME: https://github.com/LiteLT/Amincapp-Apple/issues/1
            Text(activity.text ?? "")
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(10)

            // The buttons stored in the HStack look squashed without this Spacer.
            Spacer()

            HStack {
                Spacer()

                Button {
                    like()
                } label: {
                    Label("\(activity.likeCount)", systemImage: activity.isLiked == true ? "heart.fill" : "heart")
                }

                // FIXME: https://github.com/LiteLT/Amincapp-Apple/issues/2
                Label("\(activity.replyCount)", systemImage: "bubble.left")
                    .foregroundColor(.accentColor)
                    .disabled(activity.isLocked ?? true)
            }
        }.contextMenu {
            // TODO: On hover, display users who liked the activity.
            Button {
                like()
            } label: {
                let isLiked = activity.isLiked ?? false

                Label(isLiked ? "Unlike" : "Like", systemImage: isLiked ? "heart.fill" : "heart")
                    .foregroundColor(.accentColor)
            }

            let isSubscribed = activity.isSubscribed ?? false

            Button {
                if currentUser.users.isEmpty {
                    error = .unauthorized
                } else {
                    viewModel.subscribe(id: activity.id, subscribe: !isSubscribed)
                }
            } label: {
                Label(isSubscribed ? "Unsubscribe" : "Subscribe", systemImage: isSubscribed ? "bell.fill" : "bell")
            }

            if !currentUser.users.isEmpty && activity.user?.id == currentUser.users[0].id {
                Button {
                    isPresentingDeleteNotice = true
                } label: {
                    Label("Delete", systemImage: "minus.circle")
                }
            }

            #if DEBUG
            Button {
                UIPasteboard.general.string = "\(activity.id)"
            } label: {
                Label("Copy Activity ID", systemImage: "doc.on.doc")
            }

            Button {
                if let id = activity.user?.id {
                    UIPasteboard.general.string = "\(id)"
                } else {
                    logger.notice("Could not copy user ID to clipboard: activity.user was nil")
                }
            } label: {
                Label("Copy User ID", systemImage: "doc.on.doc")
            }

            Button {
                UIPasteboard.general.string = "\(activity.createdAt * 1000)"
            } label: {
                Label("Copy Message Timestamp", systemImage: "doc.on.doc")
            }

            #endif
        }.alert(item: $error) { err in
            Alert(title: Text(err.message()))
        }.alert(isPresented: $isPresentingDeleteNotice) {
            Alert(
                title: Text("Are you sure you would like to delete this activity?"),
                message: Text("This action cannot be undone."),
                primaryButton: .cancel(),
                secondaryButton: .destructive(Text("Delete")) {
                    viewModel.delete(id: activity.id)
                }
            )
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
