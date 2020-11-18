//
//  ProfileView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 10/11/20.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var currentUser: CurrentUser

    var body: some View {
        if let id = currentUser.user?.id {
            UserView(viewModel: UserViewModel(id: id))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
