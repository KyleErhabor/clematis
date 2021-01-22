//
//  MediaSummaryPropertyEndDateView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/21/21.
//

import SwiftUI

struct MediaSummaryPropertyEndDateView: View {
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

struct MediaSummaryPropertyEndDateView_Previews: PreviewProvider {
    static var previews: some View {
        MediaSummaryPropertyEndDateView()
    }
}
