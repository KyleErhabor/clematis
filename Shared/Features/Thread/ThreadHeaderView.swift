//
//  ThreadHeaderView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/3/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct ThreadHeaderView: View {
    @EnvironmentObject private var viewModel: ThreadViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                let creationDate = Date(timeIntervalSince1970: TimeInterval(viewModel.thread?.createdAt ?? 0))

                if let user = viewModel.thread?.user {
                    UserPreviewView(user: user.fragments.userPreviewFragment)
                }

                Spacer()

                Text(creationDate, formatter: RelativeDateTimeFormatter())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Text("\(viewModel.thread?.body ?? "")")
                .fixedSize(horizontal: false, vertical: true)

            HStack {
                Spacer()

                Label("\(viewModel.thread?.viewCount ?? 0)", systemImage: "eye")

                Label("\(viewModel.thread?.replyCount ?? 0)", systemImage: "bubble.left.and.bubble.right")

                if viewModel.thread?.isSticky == true {
                    Label {
                        Text("Pinned")
                            .bold()
                    } icon: {
                        Image(systemName: "pin")
                    }.foregroundColor(.yellow)
                }

                if viewModel.thread?.isLocked == true {
                    Label {
                        Text("Locked")
                            .bold()
                    } icon: {
                        Image(systemName: "lock")
                    }.foregroundColor(.red)
                }

                let isLiked = viewModel.thread?.isLiked == true

                Button {
                    viewModel.like()
                } label: {
                    Label("\(viewModel.thread?.likeCount ?? 0)", systemImage: isLiked ? "heart.fill" : "heart")
                }
            }.font(.caption)
            .foregroundColor(.secondary)
            .padding(.vertical)
        }
    }
}
