//
//  UserPreviewView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/5/21.
//

import SDWebImageSwiftUI
import SwiftUI


struct UserPreviewView: View {
    private let user: UserPreviewFragment

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            NavigationLink(destination: UserView(viewModel: UserViewModel(id: user.id))) {
                WebImage(url: URL(string: "\(user.avatar?.large ?? "")"))
                    .resizable()
                    .placeholder { Color.accentColor }
                    .scaledToFill()
                    .frame(width: 32, height: 32, alignment: .top)
                    .clipped()
                    .cornerRadius(4)

                Text("\(user.name)")
                    .font(.headline)
            }.animation(.default)
            .buttonStyle(PlainButtonStyle())
        }
    }

    init(user: UserPreviewFragment) {
        self.user = user
    }
}

struct UserPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        UserPreviewView(user: UserPreviewFragment(id: 416582, name: "maklax"))
    }
}
