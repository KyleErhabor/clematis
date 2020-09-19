//
//  ActivityUnion+Identifiable.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 9/19/20.
//

extension GlobalActivityFeedQuery.Data.Page.Activity.Fragments: Identifiable {
    // I hate you so much. Curse you, Apollo GraphQL fragments.
    public var id: Int {
        (self.textActivityFragment?.id ?? self.listActivityFragment?.id)!
    }
}
