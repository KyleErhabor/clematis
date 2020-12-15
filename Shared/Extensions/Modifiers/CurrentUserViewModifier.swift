//
//  CurrentUserViewModifier.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 12/9/20.
//

import SwiftUI

fileprivate struct CurrentUserViewModifier: ViewModifier {
    @EnvironmentObject private var currentUser: CurrentUser

    func body(content: Content) -> some View {
        content.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if let user = currentUser.user {
                    Menu {
                        Text("Signed in as \(user.name)")

                        Button {
                            currentUser.removeUser()
                        } label: {
                            Label("Sign Out", systemImage: "person.crop.circle.badge.minus")
                        }
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .imageScale(.large)
                    }
                } else {
                    Link(destination: AniList.authorizationURL) {
                        Image(systemName: "person.crop.circle.badge.plus")
                    }
                }
            }
        }
    }
}

extension View {
    func currentUser() -> some View {
        modifier(CurrentUserViewModifier())
    }
}
