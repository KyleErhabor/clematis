//
//  ThreadQuery+Identifiable.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/3/21.
//

import Apollo

extension ThreadQuery.Data.Page.ThreadComment: Identifiable {
    var children: [Self]? {
        get {
            if case let .array(children) = childComments {
                return children.map { try! .init(jsonObject: $0 as! JSONObject) }
            }

            return nil
        }
    }
}

extension ThreadQuery.Data.Page.ThreadComment: Hashable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
