//
//  ActivityListActivityView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 11/21/20.
//

import SDWebImageSwiftUI
import SwiftUI

struct ActivityListActivityView: View {
    let activity: ActivityFeedQuery.Data.Page.Activity.AsListActivity
    @Binding var selection: String?

    var body: some View {
        HStack {
            let color = activity.media?.coverImage?.color == nil
                ? Color.accentColor
                : Color(hex: Int(activity.media!.coverImage!.color!.dropFirst(), radix: 16)!)

            WebImage(url: URL(string: activity.media?.coverImage?.extraLarge ?? ""))
                .resizable()
                .placeholder { color }
                .cornerRadius(8)
                .frame(width: 90, height: 135)

            VStack(alignment: .leading) {
                Spacer()

                HStack(alignment: .top) {
                    Text(activity.media?.title?.userPreferred ?? "").bold()
                    Spacer()
                    Text(DateFormatter.localizedString(
                        from: Date(timeIntervalSince1970: TimeInterval(activity.createdAt)),
                        dateStyle: .short,
                        timeStyle: .short
                    )).font(.footnote)
                }

                Text("\(activity.status?.capitalizeFirstLetter() ?? "?") \(activity.progress ?? "")")

                HStack {
                    WebImage(url: URL(string: activity.user?.avatar?.large ?? ""))
                        .resizable()
                        .placeholder { Color.accentColor }
                        .cornerRadius(8)
                        .frame(width: 36, height: 36)

                    Text("\(activity.user?.name ?? "?")")
                }

                Spacer()

                HStack {
                    // TODO: Find an alternative for allocating a small amount of space for balancing space.
                    Text("")
                    Spacer()
                    Label("\(activity.replyCount)", systemImage: "bubble.left").foregroundColor(.accentColor)
                    Label("\(activity.likeCount)", systemImage: "heart").foregroundColor(.accentColor)
                }
            }
        }.animation(.default)
    }
}
