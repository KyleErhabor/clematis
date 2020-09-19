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

    enum ALMetadata {
        static var authURL: URL {
            var components = URLComponents(string: "https://anilist.co/api/v2/oauth/authorize")!
            components.queryItems = [
                URLQueryItem(name: "client_id", value: "1652"),
                URLQueryItem(name: "response_type", value: "token")
            ]

            return components.url!
        }
    }
}
