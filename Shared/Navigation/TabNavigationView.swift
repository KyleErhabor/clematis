//
//  TabNavigationView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/2/21.
//

import SwiftUI

struct TabNavigationView: View {
    var body: some View {
        TabView {
            NavigationView {
                UserView()
            }.tabItem {
                Label("Profile", systemImage: "person.crop.circle")
            }

            NavigationView {
                ActivityFeedView()
            }.tabItem {
                Label("Home", systemImage: "house")
            }
        }
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}
