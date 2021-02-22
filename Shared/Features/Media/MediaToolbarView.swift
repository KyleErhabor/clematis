//
//  MediaToolbarView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct MediaToolbarView: View {
    @EnvironmentObject private var viewModel: MediaViewModel
    @State private var sheet = false

    var body: some View {
        Button {
            sheet = true
        } label: {
            Label("Edit", systemImage: "pencil.circle")
        }.sheet(isPresented: $sheet) {
            MediaEditorView(viewModel: MediaEditorViewModel(id: viewModel.id))
        }
    }
}

struct MediaToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        MediaToolbarView()
    }
}
