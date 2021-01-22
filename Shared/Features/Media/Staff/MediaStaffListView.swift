//
//  MediaStaffListView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/17/21.
//

import SwiftUI

struct MediaStaffListView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if viewModel.media?.staff?.edges?.isEmpty == false {
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading) {
                    NavigationLink(destination: MediaStaffListExtendedView().environmentObject(viewModel)) {
                        Text("Staff")
                            .font(.title)
                            .bold()
                    }.buttonStyle(PlainButtonStyle())
                    
                    let total = viewModel.media?.staff?.pageInfo?.total
                        ?? viewModel.media?.staff?.edges?.count
                        ?? 0
                    
                    Text("\(total) Total")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                NavigationLink(destination: MediaStaffListExtendedView().environmentObject(viewModel)) {
                    Text("See All")
                        .font(.headline)
                }
            }
            
            let edges = viewModel.media?.staff?.edges?.prefix(4).compactMap { $0?.node == nil ? nil : $0 } ?? []
            
            Divider()
            
            ForEach(edges, id: \.id) { edge in
                MediaStaffView(edge: edge)
                Divider()
            }
        }
    }
}

fileprivate struct MediaStaffListExtendedView: View {
    @EnvironmentObject private var viewModel: MediaViewModel
    @State private var page = 1

    var body: some View {
        let edges = viewModel.media?.staff?.edges?.compactMap { $0?.node == nil ? nil : $0 } ?? []

        List(Array(edges.enumerated()), id: \.element.id) { (index, edge) in
            ScrollView {
                MediaStaffView(edge: edge).onAppear {
                    let hasNextPage = viewModel.media?.staff?.pageInfo?.hasNextPage == true

                    if index == edges.count - 1 && hasNextPage {
                        page += 1
                        viewModel.nextStaffPage(page: page)
                    }
                }
            }
        }.navigationTitle("Staff")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct MediaStaffListView_Previews: PreviewProvider {
    static var previews: some View {
        MediaStaffListView()
    }
}
