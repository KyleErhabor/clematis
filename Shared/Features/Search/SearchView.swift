//
//  SearchView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/17/21.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    @State private var tab = SearchViewTab.browse

    var body: some View {
        ScrollView {
            VStack {
                Picker("Tab", selection: $tab.animation()) {
                    Text("Browse")
                        .tag(SearchViewTab.browse)

                    Text("Search")
                        .tag(SearchViewTab.search)
                }.pickerStyle(SegmentedPickerStyle())

                switch tab {
                    case .browse:
                        SearchBrowseView()
                            .padding(.vertical)
                    case .search:
                        SearchQueryView()
                            .padding(.vertical)
                }
            }.padding()
        }.navigationTitle("Search")
        .navigationBarTitleDisplayMode(.large)
        .environmentObject(viewModel)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
