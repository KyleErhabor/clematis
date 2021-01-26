//
//  MediaReviewView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/22/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct MediaReviewView: View {
    private(set) var review: MediaQuery.Data.Medium.Review.Node

    var body: some View {
        GroupBox(label: MediaReviewLabelView(review: review)) {
            MediaReviewContentView(review: review)
        }
    }
}

fileprivate struct MediaReviewLabelView: View {
    private(set) var review: MediaQuery.Data.Medium.Review.Node

    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short

        return formatter
    }()

    var body: some View {
        HStack {
            if let user = review.user {
                NavigationLink(destination: UserView(viewModel: UserViewModel(id: user.id))) {
                    Label {
                        Text("\(user.name)")
                    } icon: {
                        WebImage(url: URL(string: user.avatar?.large ?? ""))
                            .resizable()
                            .placeholder { Color.accentColor }
                            .scaledToFill()
                            .frame(width: 36, height: 36, alignment: .top)
                            .clipped()
                            .cornerRadius(4)
                    }
                }
            }

            Spacer()

            if review.private == true {
                Image(systemName: "lock")
                    .foregroundColor(.red)
            }

            Text("\(formatter.string(from: Date(timeIntervalSince1970: TimeInterval(review.createdAt))))")
                .font(.caption)
                .foregroundColor(.secondary)
                .bold()
        }
    }
}

fileprivate struct MediaReviewContentView: View {
    private(set) var review: MediaQuery.Data.Medium.Review.Node

    var body: some View {
        let ratingColor: Color = review.userRating == .upVote ? .green : .secondary
        let ratingAmountColor: Color = review.userRating == .downVote ? .red : .secondary

        Text(review.summary ?? "")

        Divider()

        HStack {
            NavigationLink(destination: ReviewView()) {
                Text("Read")
                    .bold()
            }.foregroundColor(.accentColor)

            Spacer()

            Text("\(review.rating ?? 0)").bold().foregroundColor(ratingColor)
                + Text(" out of ")
                + Text("\(review.ratingAmount ?? 0)").bold().foregroundColor(ratingAmountColor)
                + Text(" users liked this review")
        }.font(.footnote)
        .foregroundColor(.secondary)
        .animation(.default)
    }
}
