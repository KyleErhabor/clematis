//
//  ActivityReplyListView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/31/21.
//

import SwiftUI

struct ActivityReplyListView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @StateObject var viewModel: ActivityReplyListViewModel
    @State private var isPresenting = false
    
    var body: some View {
        List(viewModel.replies, id: \.id) { reply in
            ScrollView {
                ActivityReplyView(reply: reply)
            }
        }.navigationBarTitle("Replies")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isPresenting = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
        }.sheet(isPresented: $isPresenting) {
            ActivityReplyEditorView()
                .environmentObject(currentUser)
        }.environmentObject(viewModel)
        .onAppear {
            viewModel.load()
        }
    }
}

struct ActivityReplyListView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityReplyListView(viewModel: ActivityReplyListViewModel(id: 165963255))
    }
}
