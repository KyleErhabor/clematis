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
        ScrollView(.horizontal, showsIndicators: false) {
            Divider()

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

            Divider()
        }
    }
}

struct MediaSummaryPropertyView: View {
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
