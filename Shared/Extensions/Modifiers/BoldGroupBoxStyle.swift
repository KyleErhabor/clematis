//
//  BoldGroupBoxStyle.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SwiftUI

struct BoldGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.label
                .font(Font.body.bold())
                .textCase(.uppercase)
                .foregroundColor(Color(.systemGray2))
                .padding(.bottom, 2)

            configuration.content
                .font(Font.title3.bold())
                .foregroundColor(.secondary)
        }.padding()
    }
}
