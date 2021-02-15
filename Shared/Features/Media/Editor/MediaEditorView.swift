//
//  MediaEditorView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/15/21.
//

import SwiftUI

struct MediaEditorView: View {
    @StateObject var viewModel: MediaEditorViewModel

    var body: some View {
        Text("Hello, World!")
    }
}

struct MediaEditorView_Previews: PreviewProvider {
    static var previews: some View {
        MediaEditorView(viewModel: .init(id: 302))
    }
}
