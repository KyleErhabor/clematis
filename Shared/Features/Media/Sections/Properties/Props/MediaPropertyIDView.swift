//
//  MediaPropertyIDView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertyIDView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        #if DEBUG
        MediaPropertyView("ID") {
            Text(String(viewModel.id))
        }

        #endif
    }
}

struct MediaPropertyIDView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyIDView()
    }
}
