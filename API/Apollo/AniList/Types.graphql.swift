// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// Activity type enum.
public enum ActivityType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// A text activity
  case text
  /// A anime list update activity
  case animeList
  /// A manga list update activity
  case mangaList
  /// A text message activity sent to another user
  case message
  /// Anime & Manga list update, only used in query arguments
  case mediaList
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "TEXT": self = .text
      case "ANIME_LIST": self = .animeList
      case "MANGA_LIST": self = .mangaList
      case "MESSAGE": self = .message
      case "MEDIA_LIST": self = .mediaList
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .text: return "TEXT"
      case .animeList: return "ANIME_LIST"
      case .mangaList: return "MANGA_LIST"
      case .message: return "MESSAGE"
      case .mediaList: return "MEDIA_LIST"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ActivityType, rhs: ActivityType) -> Bool {
    switch (lhs, rhs) {
      case (.text, .text): return true
      case (.animeList, .animeList): return true
      case (.mangaList, .mangaList): return true
      case (.message, .message): return true
      case (.mediaList, .mediaList): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [ActivityType] {
    return [
      .text,
      .animeList,
      .mangaList,
      .message,
      .mediaList,
    ]
  }
}
