//
//  ActivityUnion+Identifiable.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 10/8/20.
//

extension UserActivityQuery.Data.Page.Activity: Identifiable {
    public var id: Int {
        return (asListActivity?.id ?? asTextActivity?.id ?? asMessageActivity?.id)!
    }
}
