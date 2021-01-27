//
//  SidebarNavigationView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 12/23/20.
//

import SwiftUI

struct SidebarNavigationView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @State private var isPresenting = false

    var body: some View {
        // Refer to the note in `ContentView.swift`
        List {
            Section(header: Text("AniList")) {
                NavigationLink(destination: ActivityFeedView()) {
                    Label("Home", systemImage: "house")
                }
            }

            if let user = currentUser.users.first {
                Section(header: Text("Profile")) {
                    NavigationLink(destination: UserView(viewModel: UserViewModel(id: user.id))) {
                        Label("\(user.name)", systemImage: "person.crop.circle")
                    }
                }
            }

            HStack {
                Spacer()
                
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
                            currentUser.removeUsers(at: .init(integer: 0))
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

                Spacer()
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
