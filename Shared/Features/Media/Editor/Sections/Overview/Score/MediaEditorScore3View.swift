//
//  MediaEditorScore3View.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/15/21.
//

import SwiftUI

struct MediaEditorScore3View: View {
    @Binding var score: Double

    var body: some View {
        Picker("Score", selection: $score) {
            ForEach(1..<4) { smiley in
                // In the future, it would be better to display three separate SF images. This would require creating a
                // custom SF image since SF Symbols only features face.smiling.
                Image(systemName: "face.smiling")
                    .tag(Double(smiley))
            }
        }.pickerStyle(SegmentedPickerStyle())
    }
}

struct MediaEditorScore3View_Previews: PreviewProvider {
    @State static private var score = 3.0

    static var previews: some View {
        MediaEditorScore3View(score: $score)
    }
}
