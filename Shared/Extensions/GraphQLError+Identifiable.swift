//
//  GraphQLError+Identifiable.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/10/21.
//

import Apollo
import Foundation

// We're extending this class to make it possible to use it in cases where it must conform to `Identifiable` (such as
// when using the `.alert(item:content:)` modifier since it requires `item` conform to it)
extension GraphQLError: Identifiable {
    public var id: UUID {
        UUID()
    }
}
