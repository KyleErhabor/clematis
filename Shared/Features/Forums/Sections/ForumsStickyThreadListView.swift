//
//  ForumsStickyThreadListView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/1/21.
//

import SwiftUI

struct ForumsStickyThreadListView: View {
    @EnvironmentObject private var viewModel: ForumsViewModel

    var body: some View {
        let threads = viewModel.threads.filter({ $0.isSticky == true })

        if !threads.isEmpty {
            ForEach(threads, id: \.id) { thread in
                ForumsThreadView(thread: thread)
            }

            Divider()
        }
    }
}

struct ForumsStickyThreadListView_Previews: PreviewProvider {
    static var previews: some View {
        ForumsStickyThreadListView()
    }
}
