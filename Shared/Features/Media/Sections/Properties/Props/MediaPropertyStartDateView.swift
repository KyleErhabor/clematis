//
//  MediaPropertyStartDateView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertyStartDateView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        // NOTE: Swift date formatters fill in empty slots in dates (e.g. the day of the month) usually with a 1,
        // which can be misleading to the user. This implementation does not provide much local support for the user,
        // so if the standard library does provide this support, this view can be rewritten.
        if let date = viewModel.media?.startDate,
           date.day != nil || date.month != nil || date.year != nil {
            let day = date.day == nil ? "??" : "\(date.day!)"
            let month = date.month == nil ? "??" : "\(date.month!)"
            let year = date.year == nil ? "????" : "\(date.year!)"

            MediaPropertyView("Start Date") {
                Text("\(month)/\(day)/\(year)")
            }
        }
    }
}

struct MediaPropertyStartDateView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyStartDateView()
    }
}
