//
//  MediaSummaryPropertyStartDateView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/21/21.
//

import SwiftUI

struct MediaSummaryPropertyStartDateView: View {
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

struct MediaSummaryPropertyStartDateView_Previews: PreviewProvider {
    static var previews: some View {
        MediaSummaryPropertyStartDateView()
    }
}
