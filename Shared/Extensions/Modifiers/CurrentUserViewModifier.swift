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
                Link(destination: AniList.authorizationURL) {
                    Image(systemName: currentUser.user == nil ? "person.crop.circle.badge.plus" : "person.crop.circle")
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
