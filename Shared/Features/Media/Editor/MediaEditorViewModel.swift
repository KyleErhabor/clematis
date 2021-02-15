//
//  MediaEditorViewModel.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/15/21.
//

import Foundation

class MediaEditorViewModel: GraphQLViewModel, ObservableObject {
    let id: Int

    init(id: Int) {
        self.id = id
    }
}
