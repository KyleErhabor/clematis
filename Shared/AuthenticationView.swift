//
//  AuthenticationView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/31/21.
//

import SwiftUI

struct AuthenticationView: View {
    @EnvironmentObject private var userStore: CurrentUserStore

    var body: some View {
        VStack {
            Button {
                userStore.login()
            } label: {
                Text("Sign in with AniList")
                    .padding()
                    .padding(.horizontal, 64)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(32)
            }
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
