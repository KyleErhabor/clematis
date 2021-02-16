//
//  TabNavigationView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/2/21.
//

import SwiftUI

struct TabNavigationView: View {
    @EnvironmentObject private var userStore: CurrentUserStore
    @State private var isPresenting = true

    var body: some View {
        TabView {
            NavigationView {
                Text("")
                    .sheet(isPresented: $isPresenting) {
                        MediaEditorView(viewModel: .init(id: 30009))
                            .environmentObject(userStore)
                    }
            }.tabItem {
                Label("List Editor", systemImage: "pencil.circle")
            }

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
