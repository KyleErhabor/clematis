//
//  ContentView.swift
//  Shared
//
//  Created by Kyle Erhabor on 9/4/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            #if os(macOS)
            SidebarNavigationView()

            #else
            TabNavigationView()

            #endif

            Text("?")
//            ActivityFeedView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
