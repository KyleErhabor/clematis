//
//  MediaSummaryHeaderView.swift
//  Amincapp (iOS)
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
        HStack {
            WebImage(url: URL(string: viewModel.media?.coverImage?.extraLarge ?? ""))
                .resizable()
                .placeholder {
                    if let color = viewModel.media?.coverImage?.color {
                        Color(hex: Int(color.dropFirst(), radix: 16)!)
                    } else {
                        Color.accentColor
                    }
                }.frame(width: 180, height: 270)
                .border(colorScheme == .dark ? Color.black : Color.white, width: 8)

            VStack(alignment: .leading) {
                Text(viewModel.media?.title?.userPreferred ?? "")
                    .font(.title)
                    .fontWeight(.bold)

                // After 5, the layout starts to break outside its area.
                if let synonyms = viewModel.media?.synonyms?.compactMap({ $0 }).prefix(5), !synonyms.isEmpty {
                    ForEach(synonyms, id: \.self) { syn in
                        Text(syn)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }

                Spacer()

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
                            .font(.headline)
                            .padding(12)
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(4)
                    }

                    Spacer()

                    Button {
                        viewModel.toggleFavorite()
                    } label: {
                        Image(systemName: viewModel.media?.isFavourite == true ? "heart.fill" : "heart")
                    }

                    Button {
                        presentShareSheet()
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }.disabled(viewModel.media?.isLocked ?? true)
                .padding(.bottom, 8)
            }.padding(.top, 80)
        }.frame(height: 270)
    }

    func presentShareSheet() {
        guard viewModel.media?.siteUrl != nil, let url = URL(string: viewModel.media!.siteUrl!) else {
            return
        }

        let activity = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activity, animated: true, completion: nil)
    }
}

struct MediaSummaryHeaderView_Previews: PreviewProvider {
    @State static private var isPresenting = false

    static var previews: some View {
        MediaSummaryHeaderView(isPresenting: $isPresenting)
    }
}
