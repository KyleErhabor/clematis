//
//  MediaPropertyScoreView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct MediaPropertyScoreView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent

        return formatter
    }()

    var body: some View {
        // NumberFormatter with numberStyle set to .percent expects a number between 0.0 and 1.0.
        // The score is returned in a number between 1 and 100, so it must be divide it by 100.
        // The score needs to be converted to a Double so it doesn't remain an Int and lose its
        // value (0%).
        if let score = viewModel.media?.averageScore,
           let percentage = formatter.string(from: NSNumber(value: Double(score) / 100)) {
            GroupBox(label: Text("Score")) {
                Text("\(percentage)")
            }
        }
    }
}
