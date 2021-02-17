//
//  MediaEditorAdvancedScores10DecimalView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/16/21.
//

import SwiftUI

struct MediaEditorAdvancedScores10DecimalView: View {
    @Binding var score: Double
    var name: String

    var body: some View {
        let title = score == 0
            ? "\(name)"
            : "\(name): \(String(format: "%.1f", score))"

        VStack {
            Stepper("\(title)", value: $score, in: 0...10, step: 0.1)
            Slider(value: $score, in: 0...10)
        }
    }
}

struct MediaEditorAdvancedScores10DecimalView_Previews: PreviewProvider {
    @State static private var score = 8.0

    static var previews: some View {
        MediaEditorAdvancedScores10DecimalView(score: $score, name: "Visuals")
    }
}
