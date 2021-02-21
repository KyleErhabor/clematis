//
//  SearchQueryAnimeView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/18/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct SearchQueryAnimeView: View {
    var anime: SearchQuery.Data.Anime.Medium

    var body: some View {
        HStack {
            NavigationLink(destination: MediaView(viewModel: .init(id: anime.id))) {
                WebImage(url: URL(string: anime.coverImage?.extraLarge ?? ""))
                    .resizable()
                    .placeholder {
                        if let hex = anime.coverImage?.color,
                           let color = Int(hex, radix: 16) {
                            Color(hex: color)
                        } else {
                            Color.accentColor
                        }
                    }.scaledToFill()
                    .frame(width: 80)
                    .clipped()
                    .cornerRadius(4)
            }.animation(.default)

            VStack(alignment: .leading) {
                if let title = anime.title?.userPreferred {
                    Text("\(title)")
                        .font(.headline)
                }

                if let season = anime.season {
                    if let year = anime.seasonYear {
                        Text("\(season.rawValue.capitalized) \(String(year))")
                    } else {
                        Text("\(season.rawValue.capitalized)")
                    }
                }

                Spacer()

                Group {
                    if let format = anime.format {
                        if let episodes = anime.episodes {
                            HStack {
                                Text("\(AniList.formatString(format: format)) \u{2022} \(episodes) episodes")
                            }
                        } else {
                            Text("\(AniList.formatString(format: format))")
                        }
                    }

                    if let status = anime.status {
                        Text("\(AniList.statusString(status: status, type: .anime))")
                    }
                }.font(.caption)
                .foregroundColor(.secondary)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(anime.genres?.compactMap { $0 } ?? [], id: \.self) { genre in
                            Text("\(genre)")
                                .font(.caption)
                                .padding(4)
                                .background(Color.yellow)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                }
            }
        }.frame(height: 120)
    }
}

struct SearchQueryAnimeView_Previews: PreviewProvider {
    static var previews: some View {
        SearchQueryAnimeView(anime: .init(
            id: 302,
            format: .tv,
            genres: ["Adventure", "Drama", "Sci-Fi", "Action", "Romance", "Comedy", "Drama"],
            season: .spring,
            episodes: 26,
            seasonYear: 1978,
            status: .finished,
            title: .init(userPreferred: "Mirai Shounen Conan")
        ))
    }
}
