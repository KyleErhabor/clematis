//
//  MediaPropertyVolumesView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertyVolumesView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let volumes = viewModel.media?.volumes {
            MediaPropertyView("Volumes") {
                Text("\(volumes)")
            }
        }
    }
}

struct MediaPropertyVolumesView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyVolumesView()
    }
}
