//
//  AniList.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 11/19/20.
//

import Foundation

enum AniList {
    static let authorizationURL = URL(
        string: "https://anilist.co/api/v2/oauth/authorize?client_id=1652&response_type=token"
    )!

    enum ErrorKind: Int, Identifiable {
        case unauthorized
        case unknown

        var id: Int { rawValue }

        func message() -> String {
            switch self {
                case .unauthorized: return "You must sign in to perform this action."
                case .unknown: return "Unable to perform action."
            }
        }
    }
}
