//
//  MediaPropertiesView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct MediaPropertiesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Divider()

            HStack {
                Group {
                    MediaPropertyIDView()
                    MediaPropertyAiringView()
                    MediaPropertyFormatView()
                    MediaPropertyScoreView()
                    MediaPropertyStatusView()
                    MediaPropertySeasonView()
                    MediaPropertyStartDateView()
                    MediaPropertyEndDateView()
                    MediaPropertyEpisodesView()
                    MediaPropertyDurationView()
                }

                Group {
                    MediaPropertyChaptersView()
                    MediaPropertyVolumesView()
                    MediaPropertySourceView()
                    MediaPropertyPopularityView()
                    MediaPropertyFavoritesView()
                    MediaPropertyTrendingView()
                }
            }.groupBoxStyle(BoldGroupBoxStyle())

            Divider()
        }
    }

    static func formatter(day: Bool, month: Bool, year: Bool) -> DateFormatter {
        let formatter = DateFormatter()

        var template = ""

        if day {
            template += "d"
        }

        if month {
            template += "MMM"
        }

        if year {
            template += "y"
        }

        formatter.setLocalizedDateFormatFromTemplate(template)

        return formatter
    }
}

struct MediaPropertiesView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertiesView()
    }
}
