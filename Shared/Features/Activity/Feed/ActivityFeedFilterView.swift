//
//  ActivityFeedFilterView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/31/21.
//

import SwiftUI

/// A view for the `ActivityFeedView`'s filter presentation.
struct ActivityFeedFilterView: View {
    /// The view model instance from the `ActivityFeedView`.
    @EnvironmentObject private var viewModel: ActivityFeedViewModel

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Tab")) {
                    Picker("Tab", selection: $viewModel.tab) {
                        ForEach(ActivityFeedTab.allCases, id: \.rawValue) { tab in
                            Text("\(tab.rawValue.capitalized)")
                                .tag(tab)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
            }.navigationTitle("Filter")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ActivityFeedFilterView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityFeedFilterView()
            .environmentObject(ActivityFeedViewModel())
    }
}
