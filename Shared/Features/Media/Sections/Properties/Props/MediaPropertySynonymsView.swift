//
//  MediaPropertySynonymsView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertySynonymsView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let synonyms = viewModel.media?.synonyms?.compactMap({ $0 }), !synonyms.isEmpty {
            MediaPropertyView("Synonyms") {
                Text("\(ListFormatter.localizedString(byJoining: synonyms))")
            } expanded: {
                VStack(alignment: .leading) {
                    ForEach(Array(synonyms.enumerated()), id: \.offset) { (index, synonym) in
                        MediaPropertyView(String(index + 1)) {
                            Text("\(synonym)")
                        }
                    }
                }
            }
        }
    }
}

struct MediaPropertySynonymsView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertySynonymsView()
    }
}
