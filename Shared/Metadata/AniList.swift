//
//  AniList.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 11/19/20.
//

import SwiftUI

enum ALMetadata {
    static let authorizationURL: URL = {
        var components = URLComponents(string: "https://anilist.co/api/v2/oauth/authorize")!;
        components.queryItems = [
            URLQueryItem(name: "client_id", value: "1652"),
            URLQueryItem(name: "response_type", value: "token")
        ]

        return components.url!
    }()
}
