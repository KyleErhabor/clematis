//
//  MediaHeaderView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/10/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct MediaHeaderView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        GeometryReader { geo in
            let bannerImage = viewModel.media?.bannerImage ?? viewModel.media?.coverImage?.extraLarge ?? ""
            let placeholderColor: Color = {
                if viewModel.media?.bannerImage == nil,
                   let colorHex = viewModel.media?.coverImage?.color,
                   let colorInt = Int(colorHex.dropFirst(), radix: 16) {
                    return Color(hex: colorInt)
                } else {
                    return Color.accentColor
                }
            }()

            WebImage(url: URL(string: bannerImage))
                .resizable()
                .placeholder { placeholderColor }
                .scaledToFill()
                .frame(width: geo.size.width, height: 220)
                .clipped()
                .blur(radius: bannerImage == viewModel.media?.coverImage?.extraLarge ? 32 : 0)
        }.animation(.default)
        .frame(height: 220)
    }
}

struct MediaHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MediaHeaderView()
    }
}
