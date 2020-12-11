//
//  TabNavigationView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 9/4/20.
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

            if currentUser.user != nil {
                NavigationView {
                    Text("TODO (user tab)")
                }.tabItem {
                    Label("Profile", systemImage: "person")
                }

                NavigationView {
                    Text("TODO (my list tab)")
                }.tabItem {
                    Label("My List", systemImage: "books.vertical")
                }
            }

            NavigationView {
                Text("TODO (browse tab)")
            }.tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }

            NavigationView {
                Text("TODO (forum tab)")
            }.tabItem {
                Label("Forum", systemImage: "bubble.left.and.bubble.right")
            }
        }
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}
