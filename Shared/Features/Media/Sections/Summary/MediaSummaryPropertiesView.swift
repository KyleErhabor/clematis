//
//  MediaSummaryPropertiesView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/11/21.
//

import SwiftUI

struct MediaSummaryPropertiesView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                Group {
                    MediaSummaryPropertyAiringView()
                    MediaSummaryPropertyIDView()
                    MediaSummaryPropertyScoreView()
                    MediaSummaryPropertyFormatView()
                    MediaSummaryPropertyStatusView()
                    MediaSummaryPropertyStartDateView()
                    MediaSummaryPropertyEndDateView()
                    MediaSummaryPropertySeasonView()
                    MediaSummaryPropertyEpisodesView()
                    MediaSummaryPropertyChaptersView()
                }

                Group {
                    MediaSummaryPropertyVolumesView()
                    MediaSummaryPropertySourceView()
                    MediaSummaryPropertyPopularityView()
                    MediaSummaryPropertyFavoritesView()
                }
            }
        }
    }
}

fileprivate struct MediaSummaryPropertyView: View {
    private(set) var title: String
    private(set) var content: String
    private(set) var important: Bool = false

    var body: some View {
        VStack {
            Text(title)
                .bold()
                .textCase(.uppercase)
                .foregroundColor(Color(.systemGray2))
                .padding(.bottom, 2)

            Text(content)
                .font(.title3)
                .bold()
                .foregroundColor(important ? .accentColor : .secondary)
        }.padding()
    }
}

fileprivate struct MediaSummaryPropertyAiringView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    let formatter: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        formatter.formattingContext = .beginningOfSentence

        return formatter
    }()

    var body: some View {
        if let airing = viewModel.media?.nextAiringEpisode {
            let timeRemaining = formatter.localizedString(fromTimeInterval: TimeInterval(airing.timeUntilAiring))

            // TODO: Click to scroll to episodes
            MediaSummaryPropertyView(
                title: "Airing",
                content: "Ep. \(airing.episode): \(timeRemaining)",
                important: true
            )
        }
    }
}

fileprivate struct MediaSummaryPropertyIDView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        #if DEBUG
        MediaSummaryPropertyView(title: "ID", content: "\(viewModel.id)")

        #else
        EmptyView()

        #endif
    }
}

fileprivate struct MediaSummaryPropertyScoreView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let score = viewModel.media?.averageScore {
            MediaSummaryPropertyView(title: "Score", content: "\(score)%")
        }
    }
}

fileprivate struct MediaSummaryPropertyFormatView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let format = viewModel.media?.format {
            let format = formatString(format: format)

            if let countryCode = viewModel.media?.countryOfOrigin, countryCode != "JP",
               let country = Locale.current.localizedString(forRegionCode: countryCode) {
                if viewModel.media?.isLicensed == true {
                    MediaSummaryPropertyView(title: "Format", content: "\(format) (\(country))")
                } else {
                    MediaSummaryPropertyView(title: "Format", content: "\(format) (\(country), Doujinshi)")
                }
            } else {
                if viewModel.media?.isLicensed == true {
                    MediaSummaryPropertyView(title: "Format", content: format)
                } else {
                    MediaSummaryPropertyView(title: "Format", content: "\(format) (Doujinshi)")
                }
            }
        }
    }

    func formatString(format: MediaFormat) -> String {
        switch format {
            case .tv: return "TV"
            case .tvShort: return "TV Short"
            case .movie: return "Movie"
            case .special: return "Special"
            case .ova: return "OVA"
            case .ona: return "ONA"
            case .music: return "Music"
            case .manga: return "Manga"
            case .novel: return "Novel" // Consider Light Novel
            case .oneShot: return "One Shot"
            case let .__unknown(fmt): return fmt.capitalized
        }
    }
}

fileprivate struct MediaSummaryPropertyStatusView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let status = viewModel.media?.status,
           let type = viewModel.media?.type {
            let status = AniList.statusString(status: status, type: type)

            MediaSummaryPropertyView(title: "Status", content: status)
        }
    }
}

fileprivate struct MediaSummaryPropertyStartDateView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let startDate = viewModel.media?.startDate,
           startDate.day != nil || startDate.month != nil || startDate.year != nil {
            let day = startDate.day == nil ? "??" : "\(startDate.day!)"
            let month = startDate.month == nil ? "??" : "\(startDate.month!)"
            let year = startDate.year == nil ? "????" : "\(startDate.year!)"

            MediaSummaryPropertyView(title: "Start Date", content: "\(month)/\(day)/\(year)")
        }
    }
}

fileprivate struct MediaSummaryPropertyEndDateView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let endDate = viewModel.media?.endDate,
           endDate.day != nil || endDate.month != nil || endDate.year != nil {
            let day = endDate.day == nil ? "??" : "\(endDate.day!)"
            let month = endDate.month == nil ? "??" : "\(endDate.month!)"
            let year = endDate.year == nil ? "????" : "\(endDate.year!)"

            MediaSummaryPropertyView(title: "End Date", content: "\(month)/\(day)/\(year)")
        }
    }
}

fileprivate struct MediaSummaryPropertySeasonView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let season = viewModel.media?.season {
            if let year = viewModel.media?.seasonYear {
                MediaSummaryPropertyView(title: "Season", content: "\(season.rawValue.capitalized) \(year)")
            } else {
                MediaSummaryPropertyView(title: "Season", content: season.rawValue.capitalized)
            }
        }
    }
}

fileprivate struct MediaSummaryPropertyEpisodesView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let episodes = viewModel.media?.episodes {
            if let duration = viewModel.media?.duration {
                MediaSummaryPropertyView(title: "Episodes", content: "\(episodes) (\(duration) min.)")
            } else {
                MediaSummaryPropertyView(title: "Episodes", content: "\(episodes)")
            }
        }
    }
}

fileprivate struct MediaSummaryPropertyChaptersView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let chapters = viewModel.media?.chapters {
            MediaSummaryPropertyView(title: "Chapters", content: "\(chapters)")
        }
    }
}

fileprivate struct MediaSummaryPropertyVolumesView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let volumes = viewModel.media?.volumes {
            MediaSummaryPropertyView(title: "Volumes", content: "\(volumes)")
        }
    }
}

fileprivate struct MediaSummaryPropertySourceView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let source = viewModel.media?.source {
            MediaSummaryPropertyView(title: "Source", content: sourceString(source: source))
        }
    }

    func sourceString(source: MediaSource) -> String {
        switch source {
            case .original: return "Original"
            case .manga: return "Manga"
            case .lightNovel: return "Light Novel"
            case .visualNovel: return "Visual Novel"
            case .videoGame: return "Video Game"
            case .other: return "Other"
            case .novel: return "Novel"
            case .doujinshi: return "Doujinshi"
            case .anime: return "Anime" // Trigger moment
            case let .__unknown(src): return src.capitalized
        }
    }
}

fileprivate struct MediaSummaryPropertyPopularityView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let popularity = viewModel.media?.popularity {
            MediaSummaryPropertyView(title: "Popularity", content: popularity.abbreviated)
        }
    }
}

fileprivate struct MediaSummaryPropertyFavoritesView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let favorites = viewModel.media?.favourites {
            MediaSummaryPropertyView(title: "Favorites", content: favorites.abbreviated)
        }
    }
}

struct MediaSummaryPropertiesView_Previews: PreviewProvider {
    static var previews: some View {
        MediaSummaryPropertiesView()
    }
}
