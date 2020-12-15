//
//  MediaEditorFormCustomListView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 12/14/20.
//

import SwiftUI

struct MediaEditorFormCustomListView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @Binding private(set) var list: [String]

    private(set) var media: MediaEditorQuery.Data.Medium

    var body: some View {
        let mediaListOptions = currentUser.user!.mediaListOptions!

        if media.type == .anime {
            ForEach(mediaListOptions.animeList!.customLists!.compactMap { $0 }, id: \.self) { name in
                MediaEditorFormCustomListRowView(list: $list, name: name)
            }
        } else {
            ForEach(mediaListOptions.mangaList!.customLists!.compactMap { $0 }, id: \.self) { name in
                MediaEditorFormCustomListRowView(list: $list, name: name)
            }
        }
    }
}

fileprivate struct MediaEditorFormCustomListRowView: View {
    @Binding private(set) var list: [String]
    private(set) var name: String

    var body: some View {
        let binding: Binding<Bool> = Binding {
            list.contains(name)
        } set: { val in
            if val {
                list.append(name)
            } else {
                if let index = list.firstIndex(of: name) {
                    list.remove(at: index)
                }
            }
        }

        Toggle(name, isOn: binding)
    }
}

struct MediaEditorFormCustomListView_Previews: PreviewProvider {
    @State static private var list = ["Flower", "Poppy"]

    static var previews: some View {
        MediaEditorFormCustomListView(list: $list, media: MediaEditorQuery.Data.Medium(
            id: 1,
            type: .anime,
            chapters: nil,
            episodes: 12,
            mediaListEntry: nil
        ))
    }
}
