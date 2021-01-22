//
//  MediaStaffView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/17/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct MediaStaffView: View {
    private(set) var edge: MediaQuery.Data.Medium.Staff.Edge

    var body: some View {
        let staff = edge.node!

        HStack(spacing: 0) {
            NavigationLink(destination: StaffView()) {
                WebImage(url: URL(string: staff.image?.large ?? ""))
                    .resizable()
                    .placeholder { Color.accentColor }
                    .scaledToFill()
                    .frame(width: 80)
                    .clipped()
                    .cornerRadius(4)
            }.animation(.default)

            VStack(alignment: .leading) {
                NavigationLink(destination: StaffView()) {
                    VStack(alignment: .leading) {
                        if let full = staff.name?.full {
                            Text(full)
                                .font(.headline)
                        }

                        if let native = staff.name?.native {
                            Text(native)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }.buttonStyle(PlainButtonStyle())

                Spacer()

                if let role = edge.role {
                    Text(role)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }.padding(.horizontal, 8)

            Spacer()
        }.frame(height: 120)
        .contextMenu {

        }
    }
}
