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

/// The format the media was released in
public enum MediaFormat: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Anime broadcast on television
  case tv
  /// Anime which are under 15 minutes in length and broadcast on television
  case tvShort
  /// Anime movies with a theatrical release
  case movie
  /// Special episodes that have been included in DVD/Blu-ray releases, picture dramas, pilots, etc
  case special
  /// (Original Video Animation) Anime that have been released directly on DVD/Blu-ray without originally going through a theatrical release or television broadcast
  case ova
  /// (Original Net Animation) Anime that have been originally released online or are only available through streaming services.
  case ona
  /// Short anime released as a music video
  case music
  /// Professionally published manga with more than one chapter
  case manga
  /// Written books released as a series of light novels
  case novel
  /// Manga with just one chapter
  case oneShot
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "TV": self = .tv
      case "TV_SHORT": self = .tvShort
      case "MOVIE": self = .movie
      case "SPECIAL": self = .special
      case "OVA": self = .ova
      case "ONA": self = .ona
      case "MUSIC": self = .music
      case "MANGA": self = .manga
      case "NOVEL": self = .novel
      case "ONE_SHOT": self = .oneShot
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .tv: return "TV"
      case .tvShort: return "TV_SHORT"
      case .movie: return "MOVIE"
      case .special: return "SPECIAL"
      case .ova: return "OVA"
      case .ona: return "ONA"
      case .music: return "MUSIC"
      case .manga: return "MANGA"
      case .novel: return "NOVEL"
      case .oneShot: return "ONE_SHOT"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaFormat, rhs: MediaFormat) -> Bool {
    switch (lhs, rhs) {
      case (.tv, .tv): return true
      case (.tvShort, .tvShort): return true
      case (.movie, .movie): return true
      case (.special, .special): return true
      case (.ova, .ova): return true
      case (.ona, .ona): return true
      case (.music, .music): return true
      case (.manga, .manga): return true
      case (.novel, .novel): return true
      case (.oneShot, .oneShot): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaFormat] {
    return [
      .tv,
      .tvShort,
      .movie,
      .special,
      .ova,
      .ona,
      .music,
      .manga,
      .novel,
      .oneShot,
    ]
  }
}

public enum MediaSeason: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Months December to February
  case winter
  /// Months March to May
  case spring
  /// Months June to August
  case summer
  /// Months September to November
  case fall
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "WINTER": self = .winter
      case "SPRING": self = .spring
      case "SUMMER": self = .summer
      case "FALL": self = .fall
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .winter: return "WINTER"
      case .spring: return "SPRING"
      case .summer: return "SUMMER"
      case .fall: return "FALL"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaSeason, rhs: MediaSeason) -> Bool {
    switch (lhs, rhs) {
      case (.winter, .winter): return true
      case (.spring, .spring): return true
      case (.summer, .summer): return true
      case (.fall, .fall): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaSeason] {
    return [
      .winter,
      .spring,
      .summer,
      .fall,
    ]
  }
}

/// Source type the media was adapted from
public enum MediaSource: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// An original production not based of another work
  case original
  /// Asian comic book
  case manga
  /// Written work published in volumes
  case lightNovel
  /// Video game driven primary by text and narrative
  case visualNovel
  /// Video game
  case videoGame
  /// Other
  case other
  /// Version 2 only. Written works not published in volumes
  case novel
  /// Version 2 only. Self-published works
  case doujinshi
  /// Version 2 only. Japanese Anime
  case anime
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ORIGINAL": self = .original
      case "MANGA": self = .manga
      case "LIGHT_NOVEL": self = .lightNovel
      case "VISUAL_NOVEL": self = .visualNovel
      case "VIDEO_GAME": self = .videoGame
      case "OTHER": self = .other
      case "NOVEL": self = .novel
      case "DOUJINSHI": self = .doujinshi
      case "ANIME": self = .anime
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .original: return "ORIGINAL"
      case .manga: return "MANGA"
      case .lightNovel: return "LIGHT_NOVEL"
      case .visualNovel: return "VISUAL_NOVEL"
      case .videoGame: return "VIDEO_GAME"
      case .other: return "OTHER"
      case .novel: return "NOVEL"
      case .doujinshi: return "DOUJINSHI"
      case .anime: return "ANIME"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaSource, rhs: MediaSource) -> Bool {
    switch (lhs, rhs) {
      case (.original, .original): return true
      case (.manga, .manga): return true
      case (.lightNovel, .lightNovel): return true
      case (.visualNovel, .visualNovel): return true
      case (.videoGame, .videoGame): return true
      case (.other, .other): return true
      case (.novel, .novel): return true
      case (.doujinshi, .doujinshi): return true
      case (.anime, .anime): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaSource] {
    return [
      .original,
      .manga,
      .lightNovel,
      .visualNovel,
      .videoGame,
      .other,
      .novel,
      .doujinshi,
      .anime,
    ]
  }
}

/// The current releasing status of the media
public enum MediaStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Has completed and is no longer being released
  case finished
  /// Currently releasing
  case releasing
  /// To be released at a later date
  case notYetReleased
  /// Ended before the work could be finished
  case cancelled
  /// Version 2 only. Is currently paused from releasing and will resume at a later date
  case hiatus
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "FINISHED": self = .finished
      case "RELEASING": self = .releasing
      case "NOT_YET_RELEASED": self = .notYetReleased
      case "CANCELLED": self = .cancelled
      case "HIATUS": self = .hiatus
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .finished: return "FINISHED"
      case .releasing: return "RELEASING"
      case .notYetReleased: return "NOT_YET_RELEASED"
      case .cancelled: return "CANCELLED"
      case .hiatus: return "HIATUS"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaStatus, rhs: MediaStatus) -> Bool {
    switch (lhs, rhs) {
      case (.finished, .finished): return true
      case (.releasing, .releasing): return true
      case (.notYetReleased, .notYetReleased): return true
      case (.cancelled, .cancelled): return true
      case (.hiatus, .hiatus): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaStatus] {
    return [
      .finished,
      .releasing,
      .notYetReleased,
      .cancelled,
      .hiatus,
    ]
  }
}

/// The type of ranking
public enum MediaRankType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Ranking is based on the media's ratings/score
  case rated
  /// Ranking is based on the media's popularity
  case popular
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "RATED": self = .rated
      case "POPULAR": self = .popular
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .rated: return "RATED"
      case .popular: return "POPULAR"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaRankType, rhs: MediaRankType) -> Bool {
    switch (lhs, rhs) {
      case (.rated, .rated): return true
      case (.popular, .popular): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaRankType] {
    return [
      .rated,
      .popular,
    ]
  }
}

/// Type of relation media has to its parent.
public enum MediaRelation: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// An adaption of this media into a different format
  case adaptation
  /// Released before the relation
  case prequel
  /// Released after the relation
  case sequel
  /// The media a side story is from
  case parent
  /// A side story of the parent media
  case sideStory
  /// Shares at least 1 character
  case character
  /// A shortened and summarized version
  case summary
  /// An alternative version of the same media
  case alternative
  /// An alternative version of the media with a different primary focus
  case spinOff
  /// Other
  case other
  /// Version 2 only. The source material the media was adapted from
  case source
  /// Version 2 only.
  case compilation
  /// Version 2 only.
  case contains
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ADAPTATION": self = .adaptation
      case "PREQUEL": self = .prequel
      case "SEQUEL": self = .sequel
      case "PARENT": self = .parent
      case "SIDE_STORY": self = .sideStory
      case "CHARACTER": self = .character
      case "SUMMARY": self = .summary
      case "ALTERNATIVE": self = .alternative
      case "SPIN_OFF": self = .spinOff
      case "OTHER": self = .other
      case "SOURCE": self = .source
      case "COMPILATION": self = .compilation
      case "CONTAINS": self = .contains
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .adaptation: return "ADAPTATION"
      case .prequel: return "PREQUEL"
      case .sequel: return "SEQUEL"
      case .parent: return "PARENT"
      case .sideStory: return "SIDE_STORY"
      case .character: return "CHARACTER"
      case .summary: return "SUMMARY"
      case .alternative: return "ALTERNATIVE"
      case .spinOff: return "SPIN_OFF"
      case .other: return "OTHER"
      case .source: return "SOURCE"
      case .compilation: return "COMPILATION"
      case .contains: return "CONTAINS"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaRelation, rhs: MediaRelation) -> Bool {
    switch (lhs, rhs) {
      case (.adaptation, .adaptation): return true
      case (.prequel, .prequel): return true
      case (.sequel, .sequel): return true
      case (.parent, .parent): return true
      case (.sideStory, .sideStory): return true
      case (.character, .character): return true
      case (.summary, .summary): return true
      case (.alternative, .alternative): return true
      case (.spinOff, .spinOff): return true
      case (.other, .other): return true
      case (.source, .source): return true
      case (.compilation, .compilation): return true
      case (.contains, .contains): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaRelation] {
    return [
      .adaptation,
      .prequel,
      .sequel,
      .parent,
      .sideStory,
      .character,
      .summary,
      .alternative,
      .spinOff,
      .other,
      .source,
      .compilation,
      .contains,
    ]
  }
}

/// The role the character plays in the media
public enum CharacterRole: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// A primary character role in the media
  case main
  /// A supporting character role in the media
  case supporting
  /// A background character in the media
  case background
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "MAIN": self = .main
      case "SUPPORTING": self = .supporting
      case "BACKGROUND": self = .background
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .main: return "MAIN"
      case .supporting: return "SUPPORTING"
      case .background: return "BACKGROUND"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: CharacterRole, rhs: CharacterRole) -> Bool {
    switch (lhs, rhs) {
      case (.main, .main): return true
      case (.supporting, .supporting): return true
      case (.background, .background): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [CharacterRole] {
    return [
      .main,
      .supporting,
      .background,
    ]
  }
}

/// The primary language of the voice actor
public enum StaffLanguage: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Japanese
  case japanese
  /// English
  case english
  /// Korean
  case korean
  /// Italian
  case italian
  /// Spanish
  case spanish
  /// Portuguese
  case portuguese
  /// French
  case french
  /// German
  case german
  /// Hebrew
  case hebrew
  /// Hungarian
  case hungarian
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "JAPANESE": self = .japanese
      case "ENGLISH": self = .english
      case "KOREAN": self = .korean
      case "ITALIAN": self = .italian
      case "SPANISH": self = .spanish
      case "PORTUGUESE": self = .portuguese
      case "FRENCH": self = .french
      case "GERMAN": self = .german
      case "HEBREW": self = .hebrew
      case "HUNGARIAN": self = .hungarian
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .japanese: return "JAPANESE"
      case .english: return "ENGLISH"
      case .korean: return "KOREAN"
      case .italian: return "ITALIAN"
      case .spanish: return "SPANISH"
      case .portuguese: return "PORTUGUESE"
      case .french: return "FRENCH"
      case .german: return "GERMAN"
      case .hebrew: return "HEBREW"
      case .hungarian: return "HUNGARIAN"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: StaffLanguage, rhs: StaffLanguage) -> Bool {
    switch (lhs, rhs) {
      case (.japanese, .japanese): return true
      case (.english, .english): return true
      case (.korean, .korean): return true
      case (.italian, .italian): return true
      case (.spanish, .spanish): return true
      case (.portuguese, .portuguese): return true
      case (.french, .french): return true
      case (.german, .german): return true
      case (.hebrew, .hebrew): return true
      case (.hungarian, .hungarian): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [StaffLanguage] {
    return [
      .japanese,
      .english,
      .korean,
      .italian,
      .spanish,
      .portuguese,
      .french,
      .german,
      .hebrew,
      .hungarian,
    ]
  }
}
