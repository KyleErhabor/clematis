//
//  MediaPropertyEndDateView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct MediaPropertyEndDateView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let endDate = viewModel.media?.endDate,
           endDate.day != nil || endDate.month != nil || endDate.year != nil {
            if let date = DateComponents(
                calendar: .current,
                year: endDate.year,
                month: endDate.month,
                day: endDate.day
            ).date {
                GroupBox(label: Text("End Date")) {
                    let formatter = MediaPropertiesView.formatter(
                        day: endDate.day != nil,
                        month: endDate.month != nil,
                        year: endDate.year != nil
                    )

                    Text("\(formatter.string(from: date))")
                }
            }
        }
    }
}
