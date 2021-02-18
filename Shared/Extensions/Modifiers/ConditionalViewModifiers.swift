//
//  ConditionalViewModifiers.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/5/21.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
