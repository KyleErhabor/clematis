//
//  MediaSectionSummaryView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 12/30/20.
//

import SDWebImageSwiftUI
import SwiftUI

struct MediaSectionSummaryView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                WebImage(url: URL(string: viewModel.media?.coverImage?.extraLarge ?? ""))
                    .resizable()
                    .placeholder {
                        if let color = viewModel.media?.coverImage?.color {
                            Color(hex: Int(color.dropFirst(), radix: 16)!)
                        } else {
                            Color.accentColor
                        }
                    }.frame(width: 200, height: 300)
                    .border(Color.white, width: 8)

                VStack { // Important properties (maybe)
                    Text("Stuff")
                }
            }

            Text(viewModel.media?.title?.userPreferred ?? "")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)

            Text(viewModel.media?.description ?? "")
        }
    }
}

struct MediaSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        MediaSectionSummaryView()
    }
}
