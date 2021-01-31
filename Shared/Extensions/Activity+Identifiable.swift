//
//  Activity+Identifiable.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 10/8/20.
//

extension ActivityFeedQuery.Data.Page.Activity: Identifiable {
    public var id: Int {
        if let id = asListActivity?.fragments.listActivityFragment.id {
            return id
        } else if let id = asTextActivity?.fragments.textActivityFragment.id {
            return id
        }

        fatalError("Unknown activity kind")
    }
}
