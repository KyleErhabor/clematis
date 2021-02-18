//
//  UserAboutView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/26/21.
//

import SwiftUI

struct UserAboutView: View {
    @EnvironmentObject private var viewModel: UserViewModel
    @State private var isExpanded = false

    var body: some View {
        if let about = viewModel.user?.about {
            VStack {
                Text("\(about)")
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(isExpanded ? nil : 8)
                    .id(UUID())

                HStack {
                    Spacer()

                    Button(isExpanded ? "Show Less" : "Show More") {
                        isExpanded.toggle()
                    }
                }.padding(.top)

                Divider()
            }.animation(.default)
        }
    }
}

struct UserAboutView_Previews: PreviewProvider {
    static var previews: some View {
        UserAboutView()
    }
}
