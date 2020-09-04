//
//  ApolloNetwork.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 9/4/20.
//

import Foundation
import Apollo

class ApolloNetwork {
    static let shared = ApolloNetwork()

    private(set) lazy var anilist = ApolloClient(url: URL(string: "https://graphql.anilist.co/")!)

    enum ALConfig {
        static let clientID = 1652
    }
}
