//
//  SidebarNavigationView.swift
//  Amincapp (macOS)
//
//  Created by Kyle Erhabor on 12/22/20.
//

import SwiftUI

struct SidebarNavigationView: View {
    var body: some View {
        List {
            NavigationLink(destination: ActivityFeedView()) {
                Label("Home", systemImage: "house")
            }
        }.listStyle(SidebarListStyle())
    }
}

struct SidebarNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarNavigationView()
    }
}
