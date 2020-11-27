//
//  ActivityView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 11/25/20.
//

import SwiftUI

struct ActivityView: View {
    @StateObject var viewModel: ActivityViewModel

    var body: some View {
        NavigationView {
            if let activity = viewModel.activity {}
        }.onAppear {
            viewModel.fetchActivity()
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(viewModel: ActivityViewModel(id: 140602996))
    }
}
