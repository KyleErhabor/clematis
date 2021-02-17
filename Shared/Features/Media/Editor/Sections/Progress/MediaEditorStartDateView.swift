//
//  MediaEditorStartDateView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/16/21.
//

import SwiftUI

struct MediaEditorStartDateView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel

    var body: some View {
        let binding = Binding<Date> {
            // `viewModel.media?.mediaListEntry?.startedAt` may have a value, but there's no guarantee the values
            // inside it will not be `nil`. This may result in unethical dates to navigate through (such as the 1st of
            // January in the year 1).
            if let day = viewModel.media?.mediaListEntry?.startedAt?.day,
               let month = viewModel.media?.mediaListEntry?.startedAt?.month,
               let year = viewModel.media?.mediaListEntry?.startedAt?.year {
                return DateComponents(
                    calendar: .current,
                    year: year,
                    month: month,
                    day: day
                ).date ?? Date()
            }

            return Date()
        } set: { date in
            let components = Calendar.current.dateComponents([.day, .month, .year], from: date)
            let startedAt = MediaEditorQuery.Data.Medium.MediaListEntry.StartedAt(
                day: components.day,
                year: components.year,
                month: components.month
            )

            if viewModel.media?.mediaListEntry == nil {
                viewModel.media?.mediaListEntry = .init(id: viewModel.id, startedAt: startedAt)
            } else {
                viewModel.media?.mediaListEntry?.startedAt = startedAt
            }
        }

        if viewModel.media?.mediaListEntry?.startedAt?.day == nil
            && viewModel.media?.mediaListEntry?.startedAt?.month == nil
            && viewModel.media?.mediaListEntry?.startedAt?.year == nil {
            HStack {
                Text("Start Date")

                Spacer()

                Button("Set") {
                    withAnimation {
                        binding.wrappedValue = .init()
                    }
                }
            }
        } else {
            DatePicker("Start Date", selection: binding, displayedComponents: .date)
        }
    }
}
