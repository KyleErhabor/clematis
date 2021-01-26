//
//  UserView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 11/23/20.
//

import SwiftUI

struct UserView: View {
    @StateObject var viewModel: UserViewModel

    var body: some View {
        ScrollView {
            Text("\(viewModel.user?.name ?? "?")")
        }.navigationTitle("\(viewModel.user?.name ?? "")")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.load()
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(viewModel: UserViewModel(id: 164560))
    }
}
