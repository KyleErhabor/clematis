//
//  ThreadView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/1/21.
//

import SwiftUI

struct ThreadView: View {
    @StateObject var viewModel: ThreadViewModel

    var body: some View {
        List {
            ScrollView {
                ThreadHeaderView()
            }

            OutlineGroup(viewModel.comments, children: \.children) { comment in
                ScrollView {
                    ThreadReplyView(comment: comment)
                }
            }.listRowBackground(Color(.secondarySystemBackground))

            if viewModel.pageInfo?.hasNextPage == true {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .onAppear {
//                        viewModel.next()
                    }
            }
        }.navigationTitle(viewModel.thread?.title ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                ThreadToolbarView()
            }
        }.if(viewModel.thread == nil) { $0.redacted(reason: .placeholder) }
        .environmentObject(viewModel)
        .onAppear {
            viewModel.load()
        }
    }
}

struct ThreadView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadView(viewModel: ThreadViewModel(id: 3878))
    }
}
