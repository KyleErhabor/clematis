//
//  MediaEditorAdvancedScores100View.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/16/21.
//

import SwiftUI

struct MediaEditorAdvancedScores100View: View {
    @Binding var score: Double
    var name: String

    var body: some View {
        let title = score == 0
            ? "\(name)"
            : "\(name): \(Int(score))"

        VStack {
            Stepper("\(title)", value: $score, in: 0...100)
            Slider(value: $score, in: 0...100)
        }
    }
}

struct MediaEditorAdvancedScores100View_Previews: PreviewProvider {
    @State static private var score = 80.0

    static var previews: some View {
        MediaEditorAdvancedScores100View(score: $score, name: "Story")
    }
}
