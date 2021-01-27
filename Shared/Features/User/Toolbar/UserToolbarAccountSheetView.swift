//
//  UserToolbarAccountSheetView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/26/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct UserToolbarAccountSheetView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @State private var selectedUser = -1

    var body: some View {
        // Improve this in the future.
        NavigationView {
            List {
                ForEach(currentUser.users, id: \.id) { user in
                    Button {
                        selectedUser = user.id
                    } label: {
                        HStack {
                            Text("\(user.name)")

                            Spacer()

                            if user.id == currentUser.users.first?.id {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.accentColor)
                            }
                        }
                    }
                }.onDelete { offsets in
                    currentUser.removeUsers(at: offsets)
                }
            }.navigationTitle("Accounts")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }.onChange(of: selectedUser) { userId in
            if userId != -1, let index = currentUser.users.firstIndex(where: { $0.id == userId }) {
                currentUser.switchUser(at: index)
            }
        }
    }
}

struct UserToolbarAccountSheetView_Previews: PreviewProvider {
    static var previews: some View {
        UserToolbarAccountSheetView()
    }
}
