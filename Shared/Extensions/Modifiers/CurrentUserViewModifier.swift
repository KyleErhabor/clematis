//
//  CurrentUserViewModifier.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 12/9/20.
//

import SwiftUI

fileprivate struct CurrentUserViewModifier: ViewModifier {
    @EnvironmentObject private var currentUser: CurrentUser
    @State private var isPresenting = false

    func body(content: Content) -> some View {
        content.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if currentUser.users.count > 0 {
                    Menu {
                        Text("Signed in as \(currentUser.users[0].name)")

                        Button {
                            isPresenting = true
                        } label: {
                            Label("Switch Account", systemImage: "arrow.left.arrow.right")
                        }

                        Link(destination: AniList.authorizationURL) {
                            Label("Add Account", systemImage: "plus.circle")
                        }

                        Button {
                            currentUser.removeUser(at: 0)
                        } label: {
                            Label("Sign Out", systemImage: "minus.circle")
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
        }.actionSheet(isPresented: $isPresenting) {
            ActionSheet(
                title: Text("Accounts"),
                buttons: currentUser.users.enumerated().map { index, user in
                    .default(Text(user.name)) {
                        currentUser.switchUser(at: index)
                    }
                } + [.cancel()]
            )
        }
    }
}

extension View {
    func currentUser() -> some View {
        modifier(CurrentUserViewModifier())
    }
}
