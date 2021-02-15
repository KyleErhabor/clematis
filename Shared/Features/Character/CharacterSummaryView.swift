//
//  CharacterSummaryView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/22/21.
//

import SDWebImageSwiftUI
import SwiftUI

/// A view for displaying a summary of a character (image, name, alternative names, description).
struct CharacterSummaryView: View {
    /// The view model from the `CharacterView`.
    @EnvironmentObject private var viewModel: CharacterViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack {
                    WebImage(url: URL(string: viewModel.character?.image?.large ?? ""))
                        .resizable()
                        .placeholder { Color.accentColor }
                        .scaledToFill()
                        .frame(width: 160, height: 240)
                        .clipped()
                        .cornerRadius(4)

                }

                VStack(alignment: .leading) {
                    Text("\(viewModel.character?.name?.native ?? "")")
                        .font(.title)
                        .bold()

                    // FIXME: The divider above the description cuts under the character image if there are no
                    // alternative names.
                    ForEach(viewModel.character?.name?.alternative?.compactMap { $0 } ?? [], id: \.self) { name in
                        Text(name)
                            .foregroundColor(.secondary)
                    }
                }

                Spacer()
            }

            Divider()

            Text("\(viewModel.character?.description ?? "")")

            Divider()
        }
    }
}
