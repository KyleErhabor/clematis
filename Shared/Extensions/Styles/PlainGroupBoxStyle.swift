//
//  PlainGroupBoxStyle.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/3/21.
//

import SwiftUI

struct PlainGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label.foregroundColor(.secondary)
            configuration.content
        }
    }
}
