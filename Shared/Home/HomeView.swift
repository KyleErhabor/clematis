//
//  HomeView.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 9/4/20.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        List(viewModel.activities) { activity in
            Text("ID: \(activity.id)")
        }.onAppear {
            viewModel.loadActivities()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
