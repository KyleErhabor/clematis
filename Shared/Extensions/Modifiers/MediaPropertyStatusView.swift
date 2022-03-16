//
//  MediaPropertyStatusView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct MediaPropertyStatusView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let status = viewModel.media?.status,
           let type = viewModel.media?.type {
            GroupBox(label: Text("Status")) {
                Text("\(AniList.statusString(status: status, type: type))")
            }
        }
    }
}
