//
//  MediaStatsRankingView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/19/21.
//

import SwiftUI

struct MediaStatsRankingView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        HStack {
            let types = viewModel.media?.rankings?.compactMap { $0?.type }.distinct()

            ForEach(types ?? [], id: \.self) { type in
                let name = type.rawValue.capitalized
                let image = rankImage(type: type)
                let color = rankColor(type: type)

                GroupBox(label: Label(name, systemImage: image).foregroundColor(color)) {
                    let rankings = viewModel.media?.rankings?.compactMap { $0?.type == type ? $0 : nil }

                    ForEach(rankings ?? [], id: \.id) { ranking in
                        MediaStatsRankingRowView(ranking: ranking)
                    }

                    Spacer()
                }
            }
        }
    }

    func rankColor(type: MediaRankType) -> Color {
        switch type {
            case .popular: return .red
            case .rated: return .yellow
            case .__unknown: return .accentColor
        }
    }

    func rankImage(type: MediaRankType) -> String {
        switch type {
            case .popular: return "shippingbox" // <-- Replace for something better.
            case .rated: return "star.fill"
            case .__unknown: return ""
        }
    }
}

fileprivate struct MediaStatsRankingRowView: View {
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    private(set) var ranking: MediaQuery.Data.Medium.Ranking

    var body: some View {
        let title = ranking.context.capitalized
        let icon = imageIcon()

        GroupBox(label: Label("#\(ranking.rank)", systemImage: icon).foregroundColor(.orange)) {
            HStack {
                if let season = ranking.season, let year = ranking.year {
                    Text("\(title) \(season.rawValue.capitalized) \(String(year))")
                        .bold()
                } else if let year = ranking.year {
                    Text("\(title) \(String(year))")
                        .bold()
                } else {
                    Text("\(title)")
                        .bold()
                }

                Spacer()
            }.font(verticalSizeClass == .regular ? .caption : .headline)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.leading)
        }
    }

    func imageIcon() -> String {
        if ranking.season != nil && ranking.year != nil {
            return "leaf"
        }

        if ranking.year != nil {
            return "gyroscope" // <-- Replace for something better
        }

        return "rosette"
    }
}

struct MediaStatsRankingView_Previews: PreviewProvider {
    static var previews: some View {
        MediaStatsRankingView()
    }
}
