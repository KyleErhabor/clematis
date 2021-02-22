//
//  MediaPropertyIDView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct MediaPropertyIDView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        #if DEBUG
        GroupBox(label: Text("ID")) {
            Text("\(String(viewModel.id))")
        }

        #endif
    }
}
