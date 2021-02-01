//
//  ActivityFeedFilterView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/31/21.
//

import SwiftUI

struct ActivityFeedFilterView: View {
    @Binding private(set) var tab: ActivityFeedTab

    var body: some View {
        Form {
            Section(header: Text("Tab")) {
                Picker("Tab", selection: $tab) {
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

struct ActivityFeedFilterView_Previews: PreviewProvider {
    @State static private var tab = ActivityFeedTab.global

    static var previews: some View {
        ActivityFeedFilterView(tab: $tab)
    }
}
