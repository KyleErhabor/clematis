//
//  MediaSummaryPropertyFormatView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/21/21.
//

import SwiftUI

struct MediaSummaryPropertyFormatView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let format = viewModel.media?.format {
            let format = AniList.formatString(format: format)

            if let countryCode = viewModel.media?.countryOfOrigin, countryCode != "JP",
               let country = Locale.current.localizedString(forRegionCode: countryCode)?.capitalized {
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
}

struct MediaSummaryPropertyFormatView_Previews: PreviewProvider {
    static var previews: some View {
        MediaSummaryPropertyFormatView()
    }
}
