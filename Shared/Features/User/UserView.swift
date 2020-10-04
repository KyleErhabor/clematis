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
            GeometryReader { geometry in
                VStack {
                    UserStickyView(user: $viewModel.user)
                        .frame(height: geometry.size.height / (sizeClass == .regular ? 4 : 2))

                    UserPageView(geometry: geometry)
                }
            }.currentUser()
        }.navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            viewModel.loadUser()
        }
    }
}

struct UserPageView: View {
    let geometry: GeometryProxy

    var body: some View {
        TabView {
            UserOverviewView(geometry: geometry)
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
