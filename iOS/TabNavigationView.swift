//
//  TabNavigationView.swift
//  Anime Catalog (iOS)
//
//  Created by Kyle Erhabor on 9/4/20.
//

import SwiftUI

struct TabNavigationView: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                Label("Home", systemImage: "house")
            }

            UserView().tabItem {
                Label("Profile", systemImage: "person")
            }

            Text("TODO").tabItem { // TODO
                Label("My List", systemImage: "books.vertical")
            }

            BrowseView().tabItem {
                Label("Browse", systemImage: "magnifyingglass")
            }

            ForumView().tabItem {
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
