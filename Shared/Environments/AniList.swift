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

    static func statusName(status: MediaListStatus, type: MediaType) -> String {
        switch status {
            case .planning: return "Planning"
            case .completed: return "Completed"
            case .dropped: return "Dropped"
            case .paused: return "Paused"
            case .current:
                switch type {
                    case .anime: return "Watching"
                    case .manga: return "Reading"
                    case .__unknown: return "Current"
                }
            case .repeating:
                switch type {
                    case .anime: return "Rewatching"
                    case .manga: return "Rereading"
                    case .__unknown: return "Repeating"
                }
            case .__unknown(let name): return name.capitalized
        }
    }
}
