//
//  UserListContentProgressView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct UserListContentProgressView: View {
    /// The view model from the `UserListView`.
    @EnvironmentObject private var viewModel: UserListViewModel

    /// The global environment object for user accounts.
    @EnvironmentObject private var userStore: CurrentUserStore

    /// The list entry for this view.
    private let entry: UserListQuery.Data.MediaListCollection.List.Entry

    var body: some View {
        let binding = Binding {
            entry.progress ?? 0
        } set: { progress in
            viewModel.progress(progress, in: entry)
        }

        if let progress = entry.progress {
            let max = maxProgress()

            if userStore.users.first?.id == entry.user?.id {
                let title = max == nil
                    ? "\(progress)"
                    : "\(progress)/\(max!)"

                Stepper("\(title)", value: binding, in: 0...(max ?? Int.max))
            } else {
                Text("\(progress)")
            }

            if let max = max {
                ProgressView(value: Double(progress), total: Double(max))
            }
        }
    }

    /// Initializes the view
    /// - Parameter entry: The list entry for this view.
    init(entry: UserListQuery.Data.MediaListCollection.List.Entry) {
        self.entry = entry
    }

    func maxProgress() -> Int? {
        switch viewModel.type {
            case .anime:
                return entry.media?.episodes
            case .manga:
                return entry.media?.chapters
            case .__unknown:
                return nil
        }
    }
}

//struct UserListContentProgressView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserListContentProgressView()
//    }
//}
