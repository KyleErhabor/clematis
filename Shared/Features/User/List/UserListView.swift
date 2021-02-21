//
//  UserListView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/20/21.
//

import SwiftUI

struct UserListView: View {
    @StateObject var viewModel: UserListViewModel

    var body: some View {
        List {
            // TODO: Sort based on the section order defined by the user.
            ForEach(viewModel.collection?.lists?.compactMap { $0 } ?? [], id: \.name) { group in
                DisclosureGroup("\(group.name ?? "")") {
                    ForEach(group.entries?.compactMap { $0 } ?? [], id: \.id) { entry in
                        ScrollView {
                            UserListContentView(entry: entry)
                                .padding(.vertical, 8)
                        }
                    }
                }
            }
        }.navigationTitle("Library")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                UserListToolbarView()
            }
        }.environmentObject(viewModel)
        .onAppear {
            viewModel.load()
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(viewModel: UserListViewModel(id: 123165))
            .environmentObject(CurrentUserStore())
    }
}
