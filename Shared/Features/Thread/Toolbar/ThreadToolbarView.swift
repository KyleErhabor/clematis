//
//  ThreadToolbarView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/2/21.
//

import SwiftUI

struct ThreadToolbarView: View {
    @EnvironmentObject private var viewModel: ThreadViewModel
    @State private var isPresenting = false

    var body: some View {
        Menu {
            Button {
                isPresenting = true
            } label: {
                Label("See Likes", systemImage: "list.bullet")
            }

            Button {
                viewModel.subscribe()
            } label: {
                let isSubscribed = viewModel.thread?.isSubscribed == true

                Label(isSubscribed ? "Unsubscribe" : "Subscribe", systemImage: isSubscribed ? "bell.fill" : "bell")
            }
        } label: {
            Image(systemName: "menubar.rectangle")
        }.sheet(isPresented: $isPresenting) {
            let users = viewModel.thread?.likes?.compactMap { $0?.fragments.userPreviewFragment } ?? []

            LikeNavigationView(users: users)
        }
    }
}

struct ThreadToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadToolbarView()
    }
}
