//
//  MediaEditorScore10View.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/15/21.
//

import SwiftUI

struct MediaEditorScore10View: View {
    @Binding var score: Double

    var body: some View {
        let title = score == 0
            ? "Score"
            : "Score: \(Int(score))"

        VStack {
            Stepper("\(title)", value: $score, in: 0...10)
            Slider(value: $score, in: 0...10)
        }
    }
}

struct MediaEditorScore10View_Previews: PreviewProvider {
    @State static private var score = 8.0

    static var previews: some View {
        MediaEditorScore10View(score: $score)
    }
}
