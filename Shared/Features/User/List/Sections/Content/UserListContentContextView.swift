//
//  UserListContentContextView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/20/21.
//

import SwiftUI

/// A view displaying the context menu for the `UserListContentView`.
struct UserListContentContextView: View {
    /// A binding indicating when to present the confirmation alert to delete the list entry.
    @Binding var alert: Bool

    /// A binding indicating when to present the media list editor for this list entry.
    @Binding var sheet: Bool

    /// The list entry for this view.
    var entry: UserListQuery.Data.MediaListCollection.List.Entry

    var body: some View {
        Button {
            sheet = true
        } label: {
            Label("Open List Editor", systemImage: "pencil")
        }

        Button {
            alert = true
        } label: {
            Label("Delete", systemImage: "trash")
        }
    }
}

//struct UserListContentContextView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserListContentContextView(entry: <#UserListQuery.Data.MediaListCollection.List.Entry#>)
//    }
//}
