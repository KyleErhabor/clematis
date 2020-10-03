//
//  HomeView.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 9/4/20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("SwiftUI").navigationBarTitle("Welcome").currentUser()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
