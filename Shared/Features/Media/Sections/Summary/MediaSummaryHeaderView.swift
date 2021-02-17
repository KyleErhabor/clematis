//
//  MediaSummaryHeaderView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/11/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct MediaSummaryHeaderView: View {
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var viewModel: MediaViewModel
    @Binding private(set) var isPresenting: Bool

    var body: some View {
        HStack(alignment: .bottom) {
            WebImage(url: URL(string: viewModel.media?.coverImage?.extraLarge ?? ""))
                .resizable()
                .placeholder {
                    if let color = viewModel.media?.coverImage?.color {
                        Color(hex: Int(color.dropFirst(), radix: 16)!)
                    } else {
                        Color.accentColor
                    }
                }.scaledToFill()
                .frame(width: 117, height: 176)
                .clipped()
                .cornerRadius(4)

            HStack {
                Button {
                    isPresenting = true
                } label: {
                    let title: String = {
                        if let status = viewModel.media?.mediaListEntry?.status,
                           let type = viewModel.media?.type {
                            return AniList.statusString(status: status, type: type)
                        }

                        return "Add to List"
                    }()

                    let locked = viewModel.media?.isLocked ?? false

                    Label(locked ? "Locked" : title, systemImage: locked ? "pencil.slash" : "pencil")
                }.font(.headline)
                .padding(8)
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(4)
                .disabled(viewModel.media?.isLocked ?? true)

                Spacer()

                Button {
                    viewModel.toggleFavorite(
                        id: viewModel.id,
                        for: viewModel.media?.type == .anime ? .anime : .manga
                    )
                } label: {
                    Image(systemName: viewModel.media?.isFavourite == true ? "heart.fill" : "heart")
                }.disabled(viewModel.media?.isLocked ?? true)
            }
        }.frame(height: 176)
        .animation(.default)
    }
}

struct MediaSummaryHeaderView_Previews: PreviewProvider {
    @State static private var isPresenting = false

    static var previews: some View {
        MediaSummaryHeaderView(isPresenting: $isPresenting)
    }
}
