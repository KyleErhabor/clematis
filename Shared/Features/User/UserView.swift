//
//  UserView.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 9/4/20.
//

import SDWebImageSwiftUI
import SwiftUI

struct UserView: View {
    @Environment(\.verticalSizeClass) private var sizeClass
    @StateObject var viewModel: UserViewModel

    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack {
                    if viewModel.user != nil {
                        // FIXME: The banner should be scrollable, but it's hoisted for some reason. At first, this was a
                        // wanted feature, but it gives the user less space to work with when scrolling.
                        UserStickyView().frame(height: proxy.size.height / (sizeClass == .regular ? 4 : 2))
                        UserPageView()
                    }
                }
            }//.currentUser()
        }.navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(viewModel)
        .onAppear { viewModel.loadUser() }
    }
}

struct UserPageView: View {
    var body: some View {
        TabView {
            UserOverviewView()
            UserAnimeListView()
        }.tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(viewModel: UserViewModel(id: 164560))
        UserView(viewModel: UserViewModel(id: 1))
        UserView(viewModel: UserViewModel(id: 43326))
        UserView(viewModel: UserViewModel(id: 89440))
        UserView(viewModel: UserViewModel(id: 427436))
    }
}
