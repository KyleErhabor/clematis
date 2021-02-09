//
//  TabNavigationView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/2/21.
//

import SwiftUI

struct TabNavigationView: View {
    @EnvironmentObject private var currentUser: CurrentUser

    var body: some View {
        TabView {
            NavigationView {
                ActivityFeedView()
            }.tabItem {
                Label("Home", systemImage: "house")
            }

            NavigationView {
                if let user = currentUser.users.first {
                    UserView(viewModel: UserViewModel(id: user.id))
                } else {
                    AuthenticationView()
                }
            }.tabItem {
                Label("Profile", systemImage: "person.crop.circle")
            }

            NavigationView {
                ForumsView()
            }.tabItem {
                Label("Forums", systemImage: "text.bubble")
            }
        }
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}
