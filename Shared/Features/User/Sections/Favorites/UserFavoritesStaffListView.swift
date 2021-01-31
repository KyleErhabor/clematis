//
//  UserStaffFavoritesView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/27/21.
//

import SwiftUI

struct UserFavoritesStaffListView: View {
    @EnvironmentObject private var viewModel: UserViewModel

    var body: some View {
        let staffList = viewModel.user?.favourites?.staff?.nodes?.compactMap { $0 } ?? []

        if !staffList.isEmpty {
            let total = viewModel.user?.favourites?.staff?.pageInfo?.total
                ?? viewModel.user?.favourites?.staff?.nodes?.count
                ?? 0

            GroupBox(label: VStack(alignment: .leading) {
                Text("Staff")

                Text("\(total) Total")
                    .bold()
                    .font(.caption)
                    .foregroundColor(.secondary)
            }) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(staffList, id: \.id) { staff in
                            NavigationLink(destination: StaffView()) {
                                UserFavoriteImageView(image: URL(string: staff.image?.large ?? "")) {
                                    Color.accentColor
                                }
                            }
                        }
                    }
                }.frame(height: 120)
            }
        }
    }
}
