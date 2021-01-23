//
//  UserView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 11/23/20.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        CharacterView(viewModel: CharacterViewModel(id: 7373))
//        NavigationLink("Go", destination: CharacterView(viewModel: CharacterViewModel(id: 132151)))
//        Text("TODO (user)")
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
