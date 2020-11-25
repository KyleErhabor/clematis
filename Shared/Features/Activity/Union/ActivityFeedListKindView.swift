//
//  ActivityFeedListKindView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 11/21/20.
//

import SDWebImageSwiftUI
import SwiftUI

struct ActivityFeedListKindView: View {
    var activity: ActivityFeedQuery.Data.Page.Activity.AsListActivity

    private let dateFormatter: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full

        return formatter
    }()

    var body: some View {
        HStack {
            let color = activity.media?.coverImage?.color == nil
                ? Color.accentColor
                : Color(hex: Int(activity.media!.coverImage!.color!.dropFirst(), radix: 16)!)

            NavigationLink(destination: MediaView()) {
                WebImage(url: URL(string: activity.media?.coverImage?.extraLarge ?? ""))
                    .resizable()
                    .placeholder { color }
                    .frame(width: 90, height: 135)
                    .cornerRadius(8)
            }

            VStack(alignment: .leading) {
                HStack(alignment: .firstTextBaseline) {
                    NavigationLink(destination: MediaView()) {
                        Text("\(activity.media?.title?.userPreferred ?? "?")").bold().lineLimit(2)
                    }.buttonStyle(PlainButtonStyle())

                    Spacer()

                    Text(dateFormatter.localizedString(
                        for: Date(timeIntervalSince1970: TimeInterval(activity.createdAt)),
                        relativeTo: Date()
                    )).font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                }

                let status = activity.status?.capitalizeFirstLetter() ?? "?"

                if let progress = activity.progress {
                    Text("\(status) \(progress)")
                } else {
                    Text("\(status)")
                }

                NavigationLink(destination: UserView()) {
                    WebImage(url: URL(string: activity.user?.avatar?.large ?? ""))
                        .resizable()
                        .placeholder { Color.accentColor }
                        .cornerRadius(8)
                        .frame(width: 36, height: 36)

                    Text("\(activity.user?.name ?? "?")")
                        .fontWeight(.medium)
                }

                Spacer()

                HStack {
                    // TODO: Find an alternative for allocating a small amount of space to balance space.
                    Text("")
                    Spacer()

                    NavigationLink(destination: ActivityReplyListView()) {
                        Label("\(activity.replyCount)", systemImage: "bubble.left").foregroundColor(.accentColor)
                    }

                    let symbolName = activity.isLiked == true ? "heart.fill" : "heart"

                    // TODO: Add activity liking.
                    Label("\(activity.likeCount)", systemImage: "\(symbolName)").foregroundColor(.accentColor)
                }
            }
        }.animation(.default)
    }
}
