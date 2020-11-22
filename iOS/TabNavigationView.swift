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
            ActivityView().tabItem {
                Label("Home", systemImage: "house")
            }

            if currentUser.user != nil {
                Text("TODO (user tab)").tabItem {
                    Label("Profile", systemImage: "person")
                }

                Text("TODO (my list tab)").tabItem {
                    Label("My List", systemImage: "books.vertical")
                }
            }

            Text("TODO (browse tab)").tabItem {
                Label("Browse", systemImage: "magnifyingglass")
            }

            Text("TODO (forum tab)").tabItem {
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
