// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// Media list watching/reading status enum.
public enum MediaListStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Currently watching/reading
  case current
  /// Planning to watch/read
  case planning
  /// Finished watching/reading
  case completed
  /// Stopped watching/reading before completing
  case dropped
  /// Paused watching/reading
  case paused
  /// Re-watching/reading
  case repeating
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "CURRENT": self = .current
      case "PLANNING": self = .planning
      case "COMPLETED": self = .completed
      case "DROPPED": self = .dropped
      case "PAUSED": self = .paused
      case "REPEATING": self = .repeating
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .current: return "CURRENT"
      case .planning: return "PLANNING"
      case .completed: return "COMPLETED"
      case .dropped: return "DROPPED"
      case .paused: return "PAUSED"
      case .repeating: return "REPEATING"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaListStatus, rhs: MediaListStatus) -> Bool {
    switch (lhs, rhs) {
      case (.current, .current): return true
      case (.planning, .planning): return true
      case (.completed, .completed): return true
      case (.dropped, .dropped): return true
      case (.paused, .paused): return true
      case (.repeating, .repeating): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaListStatus] {
    return [
      .current,
      .planning,
      .completed,
      .dropped,
      .paused,
      .repeating,
    ]
  }
}

/// Date object that allows for incomplete date values (fuzzy)
public struct FuzzyDateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - year: Numeric Year (2017)
  ///   - month: Numeric Month (3)
  ///   - day: Numeric Day (24)
  public init(year: Swift.Optional<Int?> = nil, month: Swift.Optional<Int?> = nil, day: Swift.Optional<Int?> = nil) {
    graphQLMap = ["year": year, "month": month, "day": day]
  }

  /// Numeric Year (2017)
  public var year: Swift.Optional<Int?> {
    get {
      return graphQLMap["year"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "year")
    }
  }

  /// Numeric Month (3)
  public var month: Swift.Optional<Int?> {
    get {
      return graphQLMap["month"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "month")
    }
  }

  /// Numeric Day (24)
  public var day: Swift.Optional<Int?> {
    get {
      return graphQLMap["day"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "day")
    }
  }
}

/// Types that can be liked
public enum LikeableType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case thread
  case threadComment
  case activity
  case activityReply
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "THREAD": self = .thread
      case "THREAD_COMMENT": self = .threadComment
      case "ACTIVITY": self = .activity
      case "ACTIVITY_REPLY": self = .activityReply
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .thread: return "THREAD"
      case .threadComment: return "THREAD_COMMENT"
      case .activity: return "ACTIVITY"
      case .activityReply: return "ACTIVITY_REPLY"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: LikeableType, rhs: LikeableType) -> Bool {
    switch (lhs, rhs) {
      case (.thread, .thread): return true
      case (.threadComment, .threadComment): return true
      case (.activity, .activity): return true
      case (.activityReply, .activityReply): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [LikeableType] {
    return [
      .thread,
      .threadComment,
      .activity,
      .activityReply,
    ]
  }
}

/// Media list scoring type
public enum ScoreFormat: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// An integer from 0-100
  case point_100
  /// A float from 0-10 with 1 decimal place
  case point_10Decimal
  /// An integer from 0-10
  case point_10
  /// An integer from 0-5. Should be represented in Stars
  case point_5
  /// An integer from 0-3. Should be represented in Smileys. 0 => No Score, 1 => :(, 2 => :|, 3 => :)
  case point_3
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "POINT_100": self = .point_100
      case "POINT_10_DECIMAL": self = .point_10Decimal
      case "POINT_10": self = .point_10
      case "POINT_5": self = .point_5
      case "POINT_3": self = .point_3
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .point_100: return "POINT_100"
      case .point_10Decimal: return "POINT_10_DECIMAL"
      case .point_10: return "POINT_10"
      case .point_5: return "POINT_5"
      case .point_3: return "POINT_3"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ScoreFormat, rhs: ScoreFormat) -> Bool {
    switch (lhs, rhs) {
      case (.point_100, .point_100): return true
      case (.point_10Decimal, .point_10Decimal): return true
      case (.point_10, .point_10): return true
      case (.point_5, .point_5): return true
      case (.point_3, .point_3): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [ScoreFormat] {
    return [
      .point_100,
      .point_10Decimal,
      .point_10,
      .point_5,
      .point_3,
    ]
  }
}

/// Media type enum, anime or manga.
public enum MediaType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Japanese Anime
  case anime
  /// Asian comic
  case manga
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ANIME": self = .anime
      case "MANGA": self = .manga
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .anime: return "ANIME"
      case .manga: return "MANGA"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaType, rhs: MediaType) -> Bool {
    switch (lhs, rhs) {
      case (.anime, .anime): return true
      case (.manga, .manga): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaType] {
    return [
      .anime,
      .manga,
    ]
  }
}
