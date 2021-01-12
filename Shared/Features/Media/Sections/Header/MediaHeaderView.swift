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
                if viewModel.media?.bannerImage == nil, let color = viewModel.media?.coverImage?.color {
                    return Color(hex: Int(color.dropFirst(), radix: 16)!)
                } else {
                    return Color.accentColor
                }
            }()

            let bannerWebImage = WebImage(url: URL(string: bannerImage))
                .resizable()
                .placeholder { placeholderColor.colorMultiply(.gray) }
                .scaledToFill()
                .blur(radius: bannerImage == viewModel.media?.coverImage?.extraLarge ? 32 : 0)

            if geo.frame(in: .global).minY <= 0 {
                bannerWebImage
                    .frame(width: geo.size.width, height: geo.size.height)
                    .clipped()
            } else {
                bannerWebImage
                    .frame(width: geo.size.width, height: geo.size.height + geo.frame(in: .global).minY)
                    .clipped()
                    .offset(y: -geo.frame(in: .global).minY)
            }
        }.frame(height: 330)
    }
}

struct MediaHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MediaHeaderView()
    }
}
