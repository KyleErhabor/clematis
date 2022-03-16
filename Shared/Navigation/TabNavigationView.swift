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
                MediaView(viewModel: MediaViewModel(id: 1491))
            }.tabItem {
                Label("Media", systemImage: "tv.and.mediabox")
            }

            NavigationView {
                ActivityFeedView()
            }.tabItem {
                Label("Home", systemImage: "house.fill")
            }

            NavigationView {
                if let user = userStore.users.first {
                    UserView(viewModel: UserViewModel(id: user.id))
                } else {
                    AuthenticationView()
                }
            }.tabItem {
                Label("Profile", systemImage: "person.crop.circle.fill")
            }

            NavigationView {
                if let user = userStore.users.first {
                    UserListView(viewModel: UserListViewModel(id: user.id))
                } else {
                    AuthenticationView()
                }
            }.tabItem {
                Label("Library", systemImage: "books.vertical.fill")
            }

            NavigationView {
                ForumsView()
            }.tabItem {
                Label("Forums", systemImage: "text.bubble.fill")
            }

            NavigationView {
                SearchView()
            }.tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
        }
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}
