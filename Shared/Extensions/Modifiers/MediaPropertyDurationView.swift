//
//  MediaPropertyDurationView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct MediaPropertyDurationView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    private let formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .short

        return formatter
    }()

    var body: some View {
        if let duration = viewModel.media?.duration,
           let time = formatter.string(from: TimeInterval(duration * 60)) {
            GroupBox(label: Text("Duration")) {
                Text("\(time)")
            }
        }
    }
}
