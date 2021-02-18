//
//  ForumsView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/1/21.
//

import SwiftUI

struct ForumsView: View {
    @StateObject private var viewModel = ForumsViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForumsStickyThreadListView()
                ForumsActiveThreadListView()
            }.padding()
        }.navigationTitle("Forums")
        .navigationBarTitleDisplayMode(.large)
        .environmentObject(viewModel)
        .onAppear {
            viewModel.load()
        }
    }
}

struct ForumsView_Previews: PreviewProvider {
    static var previews: some View {
        ForumsView()
    }
}
