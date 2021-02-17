//
//  MediaEditorFooterView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/16/21.
//

import SwiftUI

struct MediaEditorFooterView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel

    var body: some View {
        if let updatedAt = viewModel.media?.mediaListEntry?.updatedAt {
            let updateDate = Date(timeIntervalSince1970: TimeInterval(updatedAt))

            VStack {
                Divider()
                (Text("Last Update ") + Text("\(updateDate, formatter: RelativeDateTimeFormatter())").bold())
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}
