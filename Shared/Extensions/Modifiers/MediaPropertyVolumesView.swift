//
//  MediaPropertyVolumesView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct MediaPropertyVolumesView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let volumes = viewModel.media?.volumes {
            GroupBox(label: Text("Volumes")) {
                Text("\(volumes)")
            }
        }
    }
}
