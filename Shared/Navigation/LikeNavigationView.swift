//
//  LikeNavigationView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/5/21.
//

import SwiftUI

struct LikeNavigationView: View {
    private let users: [UserPreviewFragment]

    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                UserPreviewView(user: user)
            }.navigationTitle("Likes")
            .navigationBarTitleDisplayMode(.large)
        }
    }

    init(users: [UserPreviewFragment]) {
        self.users = users
    }
}

struct LikeNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        LikeNavigationView(users: [.init(id: 476199, name: "Ereshkigal")])
    }
}
