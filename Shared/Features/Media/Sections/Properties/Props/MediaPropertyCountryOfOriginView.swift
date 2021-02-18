//
//  MediaPropertyCountryOfOriginView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertyCountryOfOriginView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let countryCode = viewModel.media?.countryOfOrigin,
           let country = Locale.current.localizedString(forRegionCode: countryCode)?.capitalized {
            MediaPropertyView("Country of Origin") {
                Text(country)
            }
        }
    }
}

struct MediaPropertyCountryOfOriginView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyCountryOfOriginView()
    }
}
