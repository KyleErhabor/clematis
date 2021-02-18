//
//  ForumsActiveThreadListView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/1/21.
//

import SwiftUI

struct ForumsActiveThreadListView: View {
    @EnvironmentObject private var viewModel: ForumsViewModel

    var body: some View {
        let threads = viewModel.threads.filter({ $0.isSticky == false })

        if !threads.isEmpty {
            Text("Active Threads")
                .bold()
                .font(.title)

            ForEach(threads, id: \.id) { thread in
                ForumsThreadView(thread: thread)
            }

            Divider()
        }
    }
}
