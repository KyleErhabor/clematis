//
//  MediaEditorScore100View.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/15/21.
//

import SwiftUI

struct MediaEditorScore100View: View {
    @Binding var score: Double

    var body: some View {
        let title = score == 0
            ? "Score"
            : "Score: \(Int(score))"

        VStack {
            Stepper("\(title)", value: $score, in: 0...100)
            Slider(value: $score, in: 0...100)
        }
    }
}

struct MediaEditorScore100View_Previews: PreviewProvider {
    @State static private var score = 80.0

    static var previews: some View {
        MediaEditorScore100View(score: $score)
    }
}
