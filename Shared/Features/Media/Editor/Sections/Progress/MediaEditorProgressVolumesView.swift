//
//  MediaEditorProgressVolumesView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/15/21.
//

import SwiftUI

struct MediaEditorProgressVolumesView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel

    var body: some View {
        if viewModel.media?.type == .manga {
            // The binding takes a double since `Slider` requires it. It's converted to an `Int` when stored.
            let binding = Binding {
                Double(viewModel.media?.mediaListEntry?.progressVolumes ?? 0)
            } set: { volumes in
                if viewModel.media?.mediaListEntry == nil {
                    viewModel.media?.mediaListEntry = .init(id: viewModel.id, progressVolumes: Int(volumes))
                } else {
                    viewModel.media?.mediaListEntry?.progressVolumes = Int(volumes)
                }
            }

            let title = binding.wrappedValue == 0
                ? "Volumes"
                : "Volumes: \(Int(binding.wrappedValue))"

            if let volumes = viewModel.media?.volumes {
                VStack {
                    Stepper("\(title)", value: binding, in: 0...Double(volumes))
                    Slider(value: binding, in: 0...Double(volumes))
                }
            } else {
                Stepper("\(title)", value: binding, in: 0...Double.greatestFiniteMagnitude)
            }
        }
    }
}
