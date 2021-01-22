//
//  MediaReviewsView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/22/21.
//

import SwiftUI

struct MediaReviewsView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if viewModel.media?.reviews?.nodes?.isEmpty == false {
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading) {
                    NavigationLink(destination: MediaReviewListExpandedView().environmentObject(viewModel)) {
                        Text("Reviews")
                            .font(.title)
                            .bold()
                    }.buttonStyle(PlainButtonStyle())

                    let total = viewModel.media?.reviews?.pageInfo?.total
                        ?? viewModel.media?.reviews?.nodes?.count
                        ?? 0

                    Text("\(total) Total")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                NavigationLink(destination: MediaReviewListExpandedView().environmentObject(viewModel)) {
                    Text("See All")
                        .font(.headline)
                        .bold()
                }
            }

            Divider()

            ForEach(viewModel.media?.reviews?.nodes?.prefix(2).compactMap { $0 } ?? [], id: \.id) { review in
                MediaReviewView(review: review)
                Divider()
            }
        }
    }
}

fileprivate struct MediaReviewListExpandedView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        List(viewModel.media?.reviews?.nodes?.prefix(6).compactMap { $0 } ?? [], id: \.id) { review in
            ScrollView {
                MediaReviewView(review: review)
            }
        }.navigationTitle("Reviews")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct MediaReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        MediaReviewsView()
    }
}
