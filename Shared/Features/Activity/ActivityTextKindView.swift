//
//  ActivityTextKindView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 12/9/20.
//

import SwiftUI

struct ActivityTextKindView: View {
//    private let activity: TextActivityFragment

    private let dateFormatter: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full

        return formatter
    }()

    var body: some View {
        Text("Hello, World!")
    }

//    init(activity: TextActivityFragment) {
//        self.activity = activity
//    }
}

struct ActivityTextKindView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityTextKindView()
    }
}
