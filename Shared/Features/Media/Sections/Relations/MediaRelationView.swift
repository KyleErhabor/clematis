//
//  MediaRelationView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/17/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct MediaRelationView: View {
    private(set) var edge: MediaQuery.Data.Medium.Relation.Edge

    var body: some View {
        let media = edge.node!

        HStack(spacing: 0) {
            NavigationLink(destination: MediaView(viewModel: MediaViewModel(id: media.id))) {
                WebImage(url: URL(string: media.coverImage?.extraLarge ?? ""))
                    .resizable()
                    .placeholder {
                        if let colorHex = media.coverImage?.color,
                           let colorInt = Int(colorHex.dropFirst(), radix: 16) {
                            Color(hex: colorInt)
                        } else {
                            Color.accentColor
                        }
                    }.scaledToFill()
                    .frame(width: 80)
                    .clipped()
                    .cornerRadius(4)
            }.animation(.default)

            VStack(alignment: .leading) {
                NavigationLink(destination: MediaView(viewModel: MediaViewModel(id: media.id))) {
                    Text(media.title?.userPreferred ?? "")
                        .font(.headline)
                }.buttonStyle(PlainButtonStyle())

                Spacer()

                Group {
                    MediaRelationSeasonYearView(media: media)
                    MediaRelationFormatStatusView(media: media)
                }.font(.subheadline)
                .foregroundColor(.secondary)
            }.padding(.horizontal, 8)

            Spacer()
        }.frame(height: 120)
        .animation(.default)
    }
}

fileprivate struct MediaRelationSeasonYearView: View {
    private(set) var media: MediaQuery.Data.Medium.Relation.Edge.Node

    var body: some View {
        let season = media.season == nil ? nil : media.season!.rawValue.capitalized
        // `String(:)` removes the commas in the year.
        let year = media.seasonYear == nil ? nil : String(media.seasonYear!)

        if let season = season {
            if let year = year {
                Label("\(season) \(year)", systemImage: "calendar")
            } else {
                Label(season, systemImage: "calendar")
            }
        } else {
            if let year = year {
                Label("\(year)", systemImage: "calendar")
            }
        }
    }
}

fileprivate struct MediaRelationFormatStatusView: View {
    private(set) var media: MediaQuery.Data.Medium.Relation.Edge.Node

    var body: some View {
        let type = media.type
        let icon = type == .anime ? "tv" : "book"
        let format = media.format == nil ? nil : AniList.formatString(format: media.format!)
        let status = media.status == nil ? nil : AniList.statusString(
            status: media.status!,
            type: type ?? .__unknown("")
        )

        if let format = format {
            if let status = status {
                let title = "\(format) \u{B7} \(status)"

                if type == nil {
                    Text(title)
                } else {
                    Label(title, systemImage: icon)
                }
            } else {
                if type == nil {
                    Text(format)
                } else {
                    Label(format, systemImage: icon)
                }
            }
        } else if let status = status {
            if type == nil {
                Text(status)
            } else {
                Label(status, systemImage: icon)
            }
        }
    }
}
