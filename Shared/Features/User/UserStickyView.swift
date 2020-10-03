//
//  UserStickyView.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 10/3/20.
//

import SDWebImageSwiftUI
import SwiftUI

struct UserStickyView: View {
    @Environment(\.verticalSizeClass) private var sizeClass
    @Binding var user: UserQuery.Data.User?

    var body: some View {
        GeometryReader { geometry in
            let bannerImageURL = user?.bannerImage == nil
                ? nil
                : URL(string: user!.bannerImage!)

            // FIXME: The user's banner looks very wide due to the `.tile` option for resizing. This is due to
            // an issue that was causing the banner to look very stretched. These issues only occur when in
            // landscape mode.
            WebImage(url: bannerImageURL)
                .resizable(resizingMode: sizeClass == .regular ? .stretch : .tile)
                .background(Color.accentColor)
                .overlay(HStack {
                    let avatarURL = user?.avatar?.large == nil
                        ? nil
                        : URL(string: user!.avatar!.large!)

                    WebImage(url: avatarURL)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 150, maxHeight: 150)

                    Text("\(user?.name ?? "")")
                        .foregroundColor(.white)
                        .bold()
                        .padding(.top, 80)
                        .shadow(color: .black, radius: 5)
                }.padding(.trailing, geometry.size.width / 2), alignment: .bottom)
                .overlay(HStack {
                    let profileColor = user?.options?.profileColor?.starts(with: "#") == true
                        ? Color(hex: Int(user!.options!.profileColor!, radix: 16)!)
                        : Color(user?.options?.profileColor ?? "AccentColor")

                    // FIXME: The status bubbles should wrap based on the size of the screen. On iPhone portrait mode,
                    // mode, having three of them cuts off the user's username due to the overlay of the username.

                    if user?.isBlocked == true {
                        UserStickyBubbleView(profileColor: profileColor, text: "Blocked")
                    }

                    if user?.isFollower == true {
                        UserStickyBubbleView(profileColor: profileColor, text: "Follower")
                    }

                    if user?.isFollowing == true {
                        UserStickyBubbleView(profileColor: profileColor, text: "Following")
                    }
                }.padding(.all, 12), alignment: .bottomTrailing)
        }.edgesIgnoringSafeArea(.all)
        .animation(.default)
    }
}

fileprivate struct UserStickyBubbleView: View {
    let profileColor: Color
    let text: String

    var body: some View {
        Text("\(text)")
            .font(.system(size: 14))
            .foregroundColor(.white)
            .bold()
            .frame(maxWidth: 76, maxHeight: 47)
            .background(profileColor)
            .cornerRadius(10)
    }
}
