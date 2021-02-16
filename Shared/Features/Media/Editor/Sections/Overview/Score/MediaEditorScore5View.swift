//
//  MediaEditorScore5View.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/15/21.
//

import SwiftUI

struct MediaEditorScore5View: View {
    @Binding var score: Double

    var body: some View {
        Picker("Score", selection: $score) {
            ForEach(1..<6) { star in
                Image(systemName: "star")
                    .tag(Double(star))
            }
        }.pickerStyle(SegmentedPickerStyle())
    }
}

struct MediaEditorScore5View_Previews: PreviewProvider {
    @State static private var score = 4.0

    static var previews: some View {
        MediaEditorScore5View(score: $score)
    }
}
