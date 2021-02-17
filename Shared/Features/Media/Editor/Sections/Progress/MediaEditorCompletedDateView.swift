//
//  MediaEditorCompletedDateView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/16/21.
//

import SwiftUI

struct MediaEditorCompletedDateView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel

    var body: some View {
        let binding = Binding<Date> {
            // `viewModel.media?.mediaListEntry?.completedAt` may have a value, but there's no guarantee the values
            // inside it will not be `nil`. This may result in unethical dates to navigate through (such as the 1st of
            // January in the year 1).
            if let day = viewModel.media?.mediaListEntry?.completedAt?.day,
               let month = viewModel.media?.mediaListEntry?.completedAt?.month,
               let year = viewModel.media?.mediaListEntry?.completedAt?.year {
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
            let completedAt = MediaEditorQuery.Data.Medium.MediaListEntry.CompletedAt(
                day: components.day,
                year: components.year,
                month: components.month
            )

            if viewModel.media?.mediaListEntry == nil {
                viewModel.media?.mediaListEntry = .init(id: viewModel.id, completedAt: completedAt)
            } else {
                viewModel.media?.mediaListEntry?.completedAt = completedAt
            }
        }

        if viewModel.media?.mediaListEntry?.completedAt?.day == nil
            && viewModel.media?.mediaListEntry?.completedAt?.month == nil
            && viewModel.media?.mediaListEntry?.completedAt?.year == nil {
            HStack {
                Text("Finish Date")

                Spacer()

                Button("Set") {
                    withAnimation {
                        binding.wrappedValue = .init()
                    }
                }
            }
        } else {
            DatePicker("Finish Date", selection: binding, displayedComponents: .date)
        }
    }
}
