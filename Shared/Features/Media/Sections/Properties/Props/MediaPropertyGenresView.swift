//
//  MediaPropertyGenresView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertyGenresView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let genres = viewModel.media?.genres?.compactMap({ $0 }), !genres.isEmpty {
            MediaPropertyView("Genres") {
                Text("\(ListFormatter.localizedString(byJoining: genres))")
            } expanded: {
                // NOTE: In the future, each genre should be a NavigationLink pointing to the browse view.
                VStack(alignment: .leading) {
                    ForEach(genres, id: \.self) { genre in
                        HStack {
                            Text("\(genre)")
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct MediaPropertyGenresView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyGenresView()
    }
}
