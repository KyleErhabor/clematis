//
//  TabNavigationView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/2/21.
//

import SwiftUI

struct TabNavigationView: View {
    @EnvironmentObject private var currentUser: CurrentUser

    var body: some View {
        TabView {
            // NOTE: https://developer.apple.com/design/human-interface-guidelines/ios/bars/tab-bars/
            // > Don’t hide a tab bar when people navigate to different areas in your app.
            //
            // We're doing this for now since it's not important.
            if let user = currentUser.users.first {
                NavigationView {
                    UserView(viewModel: UserViewModel(id: user.id))
                }.tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
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
