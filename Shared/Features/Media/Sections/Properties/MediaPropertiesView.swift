//
//  MediaPropertiesView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertiesView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        Text("Information")
            .font(.title)
            .bold()
            .padding(.bottom)

        Group {
            MediaPropertyIDView()
            MediaPropertyFormatView()
            MediaPropertyStatusView()
            MediaPropertyStartDateView()
            MediaPropertyEndDateView()
            MediaPropertySeasonView()
            MediaPropertyEpisodesView()
            MediaPropertyDurationView()
            MediaPropertyChaptersView()
            MediaPropertyVolumesView()
        }

        Group {
            MediaPropertyCountryOfOriginView()
            MediaPropertySourceView()
            MediaPropertyAverageScoreView()
            MediaPropertyMeanScoreView()
            MediaPropertyPopularityView()
        }

        // Expandable views
        Group {
            MediaPropertyTitleView()
            MediaPropertySynonymsView()
            MediaPropertyGenresView()
            MediaPropertyStudiosView()
            MediaPropertyTagsView()
            MediaPropertyExternalLinksView()
        }
    }
}

struct MediaPropertiesView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertiesView()
    }
}
