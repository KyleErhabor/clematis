//
//  UserStaffFavoritesView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/27/21.
//

import SwiftUI

struct UserStaffFavoritesView: View {
    @EnvironmentObject private var viewModel: UserViewModel

    var body: some View {
        let staffList = viewModel.user?.favourites?.staff?.nodes?.compactMap { $0 } ?? []

        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(staffList, id: \.id) { staff in
                    NavigationLink(destination: StaffView()) {
                        UserFavoriteView(
                            title: staff.name?.full ?? "",
                            image: URL(string: staff.image?.large ?? "")
                        ) {
                            Color.accentColor
                        }
                    }
                }
            }
        }.frame(height: 120)
    }
}

struct UserStaffFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        UserStaffFavoritesView()
    }
}
