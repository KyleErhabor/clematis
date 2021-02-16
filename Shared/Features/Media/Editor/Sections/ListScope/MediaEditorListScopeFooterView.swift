//
//  MediaEditorListScopeFooterView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/16/21.
//

import SwiftUI

struct MediaEditorListScopeFooterView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("\"Private\" hides the anime/manga from all your lists.")

            Text("")

            Text("\"Hidden From Status List\" hides the anime/manga from all but your custom lists.")
        }
    }
}

struct MediaEditorListScopeFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MediaEditorListScopeFooterView()
    }
}
