//
//  MediaPropertyStartDateView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct MediaPropertyStartDateView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let startDate = viewModel.media?.startDate,
           startDate.day != nil || startDate.month != nil || startDate.year != nil {
            if let date = DateComponents(
                calendar: .current,
                year: startDate.year,
                month: startDate.month,
                day: startDate.day
            ).date {
                GroupBox(label: Text("Start Date")) {
                    let formatter = MediaPropertiesView.formatter(
                        day: startDate.day != nil,
                        month: startDate.month != nil,
                        year: startDate.year != nil
                    )

                    Text("\(formatter.string(from: date))")
                }
            }
        }
    }
}
