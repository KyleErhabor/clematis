//
//  MediaEditorScore10DecimalView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/15/21.
//

import SwiftUI

struct MediaEditorScore10DecimalView: View {
    @Binding var score: Double

    var body: some View {
        let title = score == 0
            ? "Score"
            : "Score: \(String(format: "%.1f", score))"

        VStack {
            Stepper("\(title)", value: $score, in: 0...10, step: 0.1)
            Slider(value: $score, in: 0...10)
        }
    }
}

struct MediaEditorScore10DecimalView_Previews: PreviewProvider {
    @State static private var score = 8.0

    static var previews: some View {
        MediaEditorScore10DecimalView(score: $score)
    }
}
