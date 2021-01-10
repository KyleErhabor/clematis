//
//  MediaSummaryView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 12/30/20.
//

import SDWebImageSwiftUI
import SwiftUI

struct MediaSummaryView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        VStack(alignment: .leading) {
            MediaSummaryCoverView().padding()
            Divider()

            MediaSummaryAttributeListView()
            Divider()

//            Text(viewModel.media?.description ?? "").padding()
        }
    }
}

fileprivate struct MediaSummaryCoverView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        HStack {
            WebImage(url: URL(string: viewModel.media?.coverImage?.extraLarge ?? ""))
                .resizable()
                .placeholder {
                    if let color = viewModel.media?.coverImage?.color {
                        Color(hex: Int(color.dropFirst(), radix: 16)!)
                    } else {
                        Color.accentColor
                    }
                }.frame(width: 150, height: 225)
                .border(colorScheme == .dark ? Color.black : Color.white, width: 8)

            VStack {
                Text(viewModel.media?.title?.userPreferred ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)

                Text(viewModel.media?.description ?? "")
            }
        }
    }
}

fileprivate struct MediaSummaryAttributeListView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if let score = viewModel.media?.averageScore {
                    MediaSummaryAttributeView(title: "Score", value: "\(score)%")
                }
            }
        }
    }
}

fileprivate struct MediaSummaryAttributeView: View {
    private(set) var title: String
    private(set) var value: String

    var body: some View {
        VStack {
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(Color(.systemGray2))
                .padding(.bottom, 2)

            Text(value)
                .font(.system(.title, design: .rounded))
                .bold()
                .foregroundColor(.secondary)
        }.textCase(.uppercase)
        .padding()
    }
}

struct MediaSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        MediaSummaryView()
    }
}
