//
//  SidebarNavigationView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 12/23/20.
//

import SwiftUI

struct SidebarNavigationView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @State private var selection: Int? = 0
    @State private var isPresenting = false

    var body: some View {
        // Refer to the note in `ContentView.swift`
        List {
            Section(header: Text("AniList")) {
                NavigationLink(destination: ActivityFeedView(), tag: 0, selection: $selection) {
                    Label("Home", systemImage: "house")
                }
            }

            Section(header: Text("Profile")) {
                if currentUser.users.isEmpty {
                    NavigationLink(destination: UserView(), tag: 1, selection: $selection) {
                        Label("My Profile", systemImage: "person.crop.circle")
                    }
                } else {
                    NavigationLink(destination: UserView(), tag: 1, selection: $selection) {
                        Label("\(currentUser.users[0].name)", systemImage: "person.crop.circle")
                    }
                }
            }

            // On macOS, we'll likely hide the Menu controls since the user can access the settings instead.
            if currentUser.users.isEmpty {
                Link(destination: AniList.authorizationURL) {
                    Label("Sign In", systemImage: "person.crop.circle.badge.plus")
                }
            } else {
                Menu {
                    Button {
                        isPresenting = true
                    } label: {
                        Label("Switch Account", systemImage: "arrow.left.arrow.right")
                    }

                    Link(destination: AniList.authorizationURL) {
                        Label("Add Account", systemImage: "plus.circle")
                    }

                    Button {
                        currentUser.removeUser(at: 0)
                    } label: {
                        Label("Sign Out", systemImage: "minus.circle")
                    }
                } label: {
                    Text("Signed in as ") + Text(currentUser.users[0].name).bold()
                }.actionSheet(isPresented: $isPresenting) {
                    ActionSheet(
                        title: Text("Accounts"),
                        message: nil, // TODO: Add a descriptive message
                        buttons: currentUser.users.enumerated().map { index, user in
                            .default(Text(user.name)) {
                                currentUser.switchUser(at: index)
                            }
                        } + [.cancel()]
                    )
                }
            }
        }.listStyle(SidebarListStyle())
        .navigationTitle("Amincapp")
    }
}

struct SidebarNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarNavigationView()
    }
}
