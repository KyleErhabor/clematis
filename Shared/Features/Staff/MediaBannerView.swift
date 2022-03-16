//
//  MediaBannerView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct MediaBannerView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        // FIXME: The .resizable(capInsets:) modifier makes it possible to escape the safe area for the image while not
        // calling it directly on the ScrollView. However, to make the image clip to the bounds of the view, it needs
        // to be wrapped in a GeometryReader, which doesn't allow escaping unless the .ignoresSafeArea() modifier is
        // called, which needs to be applied to the `ScrollView`. The banner may look fine in portrait mode, but it'll
        // look weirdly clipped in landscape mode.
        GeometryReader { geo in
            if viewModel.media == nil || viewModel.media?.bannerImage != nil {
                WebImage(url: URL(string: viewModel.media?.bannerImage ?? ""))
                    .resizable()
                    .placeholder { Color.accentColor }
                    .scaledToFill()
                    .frame(width: geo.size.width, height: 220)
                    .clipped()
            } else {
                WebImage(url: URL(string: viewModel.media?.coverImage?.extraLarge ?? ""))
                    .resizable()
                    .placeholder {
                        if let hex = viewModel.media?.coverImage?.color,
                           let color = Int("\(hex)", radix: 16) {
                            Color(hex: color)
                        } else {
                            Color.accentColor
                        }
                    }.scaledToFill()
                    .frame(width: geo.size.width, height: 220)
                    .clipped()
                    .blur(radius: 32)
            }
        }.frame(height: 220)
        .animation(.default)
    }
}

struct MediaBannerView_Previews: PreviewProvider {
    static var previews: some View {
        MediaBannerView()
            .environmentObject(MediaViewModel(id: 98460))
    }
}
