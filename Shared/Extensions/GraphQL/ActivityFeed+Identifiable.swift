//
//  ActivityFeed+Identifiable.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/31/21.
//

extension ActivityFeedQuery.Data.Page.Activity: Identifiable {
    public var id: Int {
        if let id = asListActivity?.fragments.listActivityFragment.id {
            return id
        } else if let id = asTextActivity?.fragments.textActivityFragment.id {
            return id
        }

        fatalError("Unknown Activity Feed activity kind: \(self)")
    }
}
