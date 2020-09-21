//
//  ActivityUnion+Identifiable.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 9/19/20.
//

extension ActivityFeedQuery.Data.Page.Activity.Fragments: Identifiable {
    // I hate you so much.
    public var id: Int {
        return (textActivityFragment?.id ?? listActivityFragment?.id)!
    }
}
