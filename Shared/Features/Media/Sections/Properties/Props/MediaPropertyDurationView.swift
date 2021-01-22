//
//  MediaPropertyDurationView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertyDurationView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    private let formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .hour]
        formatter.unitsStyle = .full

        return formatter
    }()

    var body: some View {
        if let duration = viewModel.media?.duration,
           let time = formatter.string(from: TimeInterval(duration * 60)) {
            MediaPropertyView("Episode Duration") {
                Text("\(time)")
            }
        }
    }
}

struct MediaPropertyDurationView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyDurationView()
    }
}
