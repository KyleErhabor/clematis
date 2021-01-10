//
//  ContentView.swift
//  Shared
//
//  Created by Kyle Erhabor on 9/4/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        #if os(iOS)
        if UIDevice.current.userInterfaceIdiom == .phone {
            TabNavigationView()
                .navigationViewStyle(StackNavigationViewStyle())
        } else {
            NavigationView {
                // In portrait mode on iOS & iPadOS, the sidebar selects the first view and presents it -- as
                // expected. In landscape mode, a blank view is the default view. It only presents the first
                // presented view on the sidebar when the sidebar is clicked.
                //
                // The sidebar should automatically select the first view upon loading the app, so this is not
                // expected behavior in landscape mode. As a workaround, the activity feed view will be shown as
                // the first view, but this should reasonably be fixed before production. If the user clicks on
                // the sidebar, it immediately subtracts their click and reloads the activity feed view, which
                // isn't pleasant.
                SidebarNavigationView()

                ActivityFeedView()
            }
        }

        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
