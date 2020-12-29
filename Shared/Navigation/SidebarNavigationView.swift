//
//  SidebarNavigationView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 12/23/20.
//

import SwiftUI

struct SidebarNavigationView: View {
    @EnvironmentObject private var currentUser: CurrentUser

    var body: some View {
        List {
            Section(header: Text("AniList")) {
                NavigationLink(destination: ActivityFeedView()) {
                    Label("Home", systemImage: "house")
                }
            }

            Section(header: Text("Profile")) {
                if currentUser.users.isEmpty {
                    NavigationLink(destination: UserView()) {
                        Label("My Profile", systemImage: "person.crop.circle")
                    }
                } else {
                    NavigationLink(destination: UserView()) {
                        Label("\(currentUser.users[0].name)", systemImage: "person.crop.circle")
                    }
                }
            }
        }.listStyle(SidebarListStyle())
        .navigationTitle("Amincapp")
        .currentUser()
    }
}

struct SidebarNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarNavigationView()
    }
}
