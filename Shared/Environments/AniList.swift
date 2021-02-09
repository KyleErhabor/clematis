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

    enum primaryTypes { // Not going to need this soon
        case anime
        case manga
        case character
        case staff
        case studio
    }

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

    static func formatString(format: MediaFormat) -> String {
        switch format {
            case .tv: return "TV"
            case .tvShort: return "TV Short"
            case .movie: return "Movie"
            case .special: return "Special"
            case .ova: return "OVA"
            case .ona: return "ONA"
            case .music: return "Music"
            case .manga: return "Manga"
            case .novel: return "Novel" // Consider Light Novel
            case .oneShot: return "One Shot"
            case let .__unknown(fmt): return fmt.capitalized
        }
    }

    static func sourceString(source: MediaSource) -> String {
        switch source {
            case .original: return "Original"
            case .manga: return "Manga"
            case .lightNovel: return "Light Novel"
            case .visualNovel: return "Visual Novel"
            case .videoGame: return "Video Game"
            case .other: return "Other"
            case .novel: return "Novel"
            case .doujinshi: return "Doujinshi"
            case .anime: return "Anime" // Trigger moment
            case let .__unknown(src): return src.capitalized
        }
    }

    static func statusString(status: MediaListStatus, type: MediaType) -> String {
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
            case let .__unknown(name): return name.capitalized
        }
    }

    static func statusString(status: MediaStatus, type: MediaType) -> String {
        switch status {
            case .finished: return "Finished"
            case .releasing: return "Releasing"
            case .notYetReleased: return "Not Yet Released"
            case .cancelled: return "Canceled"
            case .hiatus: return "Hiatus"
            case let .__unknown(name): return name.capitalized
        }
    }
}
