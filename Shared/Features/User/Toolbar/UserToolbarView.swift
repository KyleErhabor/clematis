//
//  UserToolbarView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/26/21.
//

import SwiftUI

struct UserToolbarView: View {
    @EnvironmentObject private var userStore: CurrentUserStore
    @EnvironmentObject private var viewModel: UserViewModel
    @State private var isPresenting = false

    var body: some View {
        let isCurrentUser = userStore.users.first?.id == viewModel.id

        if userStore.users.contains(where: { $0.id == viewModel.id }) {
            Button {
                isPresenting = true
            } label: {
                Image(systemName: "arrow.left.arrow.right")
            }.sheet(isPresented: $isPresenting) {
                UserToolbarAccountSheetView()
            }
        }

        if isCurrentUser {
            NavigationLink(destination: UserNotificationListView()) {
                Image(systemName: "bell")
            }
        }

        if !isCurrentUser {
            Menu {
                Button {
                    viewModel.toggleFollow()
                } label: {
                    Text("\(viewModel.user?.isFollowing == true ? "Unfollow" : "Follow")")
                }
            } label: {
                Image(systemName: "ellipsis.circle")
            }
        }
    }
}

struct UserToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        UserToolbarView()
    }
}
