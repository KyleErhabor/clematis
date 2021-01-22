//
//  MediaSummaryView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/10/21.
//

import SwiftUI

struct MediaSummaryView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @EnvironmentObject private var viewModel: MediaViewModel
    @Binding private(set) var isPresenting: Bool
    @State private var isExpanded = false

    var body: some View {
        MediaSummaryHeaderView(isPresenting: $isPresenting)
            .padding()

        // Dividers are in the view.
        MediaSummaryPropertiesView()


        Text(viewModel.media?.description ?? "")
            .fixedSize(horizontal: false, vertical: true)
            .lineLimit(isExpanded ? nil : 5)
            .padding()
            .id(UUID())

        HStack {
            Spacer()
            
            // In the future, I'd like the "more" button to be at the end of the Text above instead of being separate.
            // Similar to how the App Store handles text longer than three lines.
            Button(isExpanded ? "See Less" : "See More") {
                withAnimation {
                    isExpanded.toggle()
                }
            }
        }.padding(.horizontal)
    }
}

struct MediaSummaryView_Previews: PreviewProvider {
    @State static private var isPresenting = false

    static var previews: some View {
        MediaSummaryView(isPresenting: $isPresenting)
    }
}
