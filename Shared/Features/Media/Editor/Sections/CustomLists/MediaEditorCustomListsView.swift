//
//  MediaEditorCustomListsView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/16/21.
//

import SwiftUI

struct MediaEditorCustomListsView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel

    var body: some View {
        if case var .dictionary(customLists) = viewModel.media?.mediaListEntry?.customLists {
            ForEach(Array(customLists.keys), id: \.self) { name in
                let binding = Binding {
                    (customLists[name] as? Bool) == true
                } set: { bool in
                    // Please don't cause an infinite loop
                    customLists[name] = bool

                    if viewModel.media?.mediaListEntry == nil {
                        viewModel.media?.mediaListEntry = .init(id: viewModel.id, customLists: .dictionary(customLists))
                    } else {
                        viewModel.media?.mediaListEntry?.customLists = .dictionary(customLists)
                    }
                }

                Toggle("\(name)", isOn: binding)
            }
        }
    }
}
