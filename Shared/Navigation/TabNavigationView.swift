//
//  TabNavigationView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/2/21.
//

import SwiftUI

struct TabNavigationView: View {
    @EnvironmentObject private var userStore: CurrentUserStore
    
    var body: some View {
        TabView {
            NavigationView {
                ActivityFeedView()
            }.tabItem {
                Label("Home", systemImage: "house")
            }

            NavigationView {
                if let user = userStore.users.first {
                    UserView(viewModel: .init(id: user.id))
                } else {
                    AuthenticationView()
                }
            }.tabItem {
                Label("Profile", systemImage: "person.crop.circle")
            }

            NavigationView {
                SearchView()
            }.tabItem {
                Label("Search", systemImage: "magnifyingglass")
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
