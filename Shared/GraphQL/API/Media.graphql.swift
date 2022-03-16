// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class MediaQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Media($id: Int!) {
      Media(id: $id) {
        __typename
        type
        format
        season
        source
        volumes
        chapters
        duration
        episodes
        isLocked
        trending
        favourites
        isLicensed
        popularity
        seasonYear
        bannerImage
        isFavourite
        averageScore
        status(version: 2)
        mediaListEntry {
          __typename
          status
        }
        title {
          __typename
          userPreferred
        }
        coverImage {
          __typename
          color
          extraLarge
        }
        nextAiringEpisode {
          __typename
          episode
          timeUntilAiring
        }
        startDate {
          __typename
          day
          year
          month
        }
        endDate {
          __typename
          day
          year
          month
        }
      }
    }
    """

  public let operationName: String = "Media"

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Media", arguments: ["id": GraphQLVariable("id")], type: .object(Medium.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(media: Medium? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
    }

    /// Media query
    public var media: Medium? {
      get {
        return (resultMap["Media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Media")
      }
    }

    public struct Medium: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Media"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .scalar(MediaType.self)),
          GraphQLField("format", type: .scalar(MediaFormat.self)),
          GraphQLField("season", type: .scalar(MediaSeason.self)),
          GraphQLField("source", type: .scalar(MediaSource.self)),
          GraphQLField("volumes", type: .scalar(Int.self)),
          GraphQLField("chapters", type: .scalar(Int.self)),
          GraphQLField("duration", type: .scalar(Int.self)),
          GraphQLField("episodes", type: .scalar(Int.self)),
          GraphQLField("isLocked", type: .scalar(Bool.self)),
          GraphQLField("trending", type: .scalar(Int.self)),
          GraphQLField("favourites", type: .scalar(Int.self)),
          GraphQLField("isLicensed", type: .scalar(Bool.self)),
          GraphQLField("popularity", type: .scalar(Int.self)),
          GraphQLField("seasonYear", type: .scalar(Int.self)),
          GraphQLField("bannerImage", type: .scalar(String.self)),
          GraphQLField("isFavourite", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("averageScore", type: .scalar(Int.self)),
          GraphQLField("status", arguments: ["version": 2], type: .scalar(MediaStatus.self)),
          GraphQLField("mediaListEntry", type: .object(MediaListEntry.selections)),
          GraphQLField("title", type: .object(Title.selections)),
          GraphQLField("coverImage", type: .object(CoverImage.selections)),
          GraphQLField("nextAiringEpisode", type: .object(NextAiringEpisode.selections)),
          GraphQLField("startDate", type: .object(StartDate.selections)),
          GraphQLField("endDate", type: .object(EndDate.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(type: MediaType? = nil, format: MediaFormat? = nil, season: MediaSeason? = nil, source: MediaSource? = nil, volumes: Int? = nil, chapters: Int? = nil, duration: Int? = nil, episodes: Int? = nil, isLocked: Bool? = nil, trending: Int? = nil, favourites: Int? = nil, isLicensed: Bool? = nil, popularity: Int? = nil, seasonYear: Int? = nil, bannerImage: String? = nil, isFavourite: Bool, averageScore: Int? = nil, status: MediaStatus? = nil, mediaListEntry: MediaListEntry? = nil, title: Title? = nil, coverImage: CoverImage? = nil, nextAiringEpisode: NextAiringEpisode? = nil, startDate: StartDate? = nil, endDate: EndDate? = nil) {
        self.init(unsafeResultMap: ["__typename": "Media", "type": type, "format": format, "season": season, "source": source, "volumes": volumes, "chapters": chapters, "duration": duration, "episodes": episodes, "isLocked": isLocked, "trending": trending, "favourites": favourites, "isLicensed": isLicensed, "popularity": popularity, "seasonYear": seasonYear, "bannerImage": bannerImage, "isFavourite": isFavourite, "averageScore": averageScore, "status": status, "mediaListEntry": mediaListEntry.flatMap { (value: MediaListEntry) -> ResultMap in value.resultMap }, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }, "nextAiringEpisode": nextAiringEpisode.flatMap { (value: NextAiringEpisode) -> ResultMap in value.resultMap }, "startDate": startDate.flatMap { (value: StartDate) -> ResultMap in value.resultMap }, "endDate": endDate.flatMap { (value: EndDate) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The type of the media; anime or manga
      public var type: MediaType? {
        get {
          return resultMap["type"] as? MediaType
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      /// The format the media was released in
      public var format: MediaFormat? {
        get {
          return resultMap["format"] as? MediaFormat
        }
        set {
          resultMap.updateValue(newValue, forKey: "format")
        }
      }

      /// The season the media was initially released in
      public var season: MediaSeason? {
        get {
          return resultMap["season"] as? MediaSeason
        }
        set {
          resultMap.updateValue(newValue, forKey: "season")
        }
      }

      /// Source type the media was adapted from.
      public var source: MediaSource? {
        get {
          return resultMap["source"] as? MediaSource
        }
        set {
          resultMap.updateValue(newValue, forKey: "source")
        }
      }

      /// The amount of volumes the manga has when complete
      public var volumes: Int? {
        get {
          return resultMap["volumes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "volumes")
        }
      }

      /// The amount of chapters the manga has when complete
      public var chapters: Int? {
        get {
          return resultMap["chapters"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "chapters")
        }
      }

      /// The general length of each anime episode in minutes
      public var duration: Int? {
        get {
          return resultMap["duration"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "duration")
        }
      }

      /// The amount of episodes the anime has when complete
      public var episodes: Int? {
        get {
          return resultMap["episodes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "episodes")
        }
      }

      /// Locked media may not be added to lists our favorited. This may be due to the entry pending for deletion or other reasons.
      public var isLocked: Bool? {
        get {
          return resultMap["isLocked"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isLocked")
        }
      }

      /// The amount of related activity in the past hour
      public var trending: Int? {
        get {
          return resultMap["trending"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "trending")
        }
      }

      /// The amount of user's who have favourited the media
      public var favourites: Int? {
        get {
          return resultMap["favourites"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "favourites")
        }
      }

      /// If the media is officially licensed or a self-published doujin release
      public var isLicensed: Bool? {
        get {
          return resultMap["isLicensed"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isLicensed")
        }
      }

      /// The number of users with the media on their list
      public var popularity: Int? {
        get {
          return resultMap["popularity"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "popularity")
        }
      }

      /// The season year the media was initially released in
      public var seasonYear: Int? {
        get {
          return resultMap["seasonYear"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "seasonYear")
        }
      }

      /// The banner image of the media
      public var bannerImage: String? {
        get {
          return resultMap["bannerImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "bannerImage")
        }
      }

      /// If the media is marked as favourite by the current authenticated user
      public var isFavourite: Bool {
        get {
          return resultMap["isFavourite"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isFavourite")
        }
      }

      /// A weighted average score of all the user's scores of the media
      public var averageScore: Int? {
        get {
          return resultMap["averageScore"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "averageScore")
        }
      }

      /// The current releasing status of the media
      public var status: MediaStatus? {
        get {
          return resultMap["status"] as? MediaStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      /// The authenticated user's media list entry for the media
      public var mediaListEntry: MediaListEntry? {
        get {
          return (resultMap["mediaListEntry"] as? ResultMap).flatMap { MediaListEntry(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "mediaListEntry")
        }
      }

      /// The official titles of the media in various languages
      public var title: Title? {
        get {
          return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "title")
        }
      }

      /// The cover images of the media
      public var coverImage: CoverImage? {
        get {
          return (resultMap["coverImage"] as? ResultMap).flatMap { CoverImage(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "coverImage")
        }
      }

      /// The media's next episode airing schedule
      public var nextAiringEpisode: NextAiringEpisode? {
        get {
          return (resultMap["nextAiringEpisode"] as? ResultMap).flatMap { NextAiringEpisode(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "nextAiringEpisode")
        }
      }

      /// The first official release date of the media
      public var startDate: StartDate? {
        get {
          return (resultMap["startDate"] as? ResultMap).flatMap { StartDate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "startDate")
        }
      }

      /// The last official release date of the media
      public var endDate: EndDate? {
        get {
          return (resultMap["endDate"] as? ResultMap).flatMap { EndDate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "endDate")
        }
      }

      public struct MediaListEntry: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaList"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("status", type: .scalar(MediaListStatus.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(status: MediaListStatus? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaList", "status": status])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The watching/reading status
        public var status: MediaListStatus? {
          get {
            return resultMap["status"] as? MediaListStatus
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }
      }

      public struct Title: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaTitle"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("userPreferred", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(userPreferred: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaTitle", "userPreferred": userPreferred])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The currently authenticated users preferred title language. Default romaji for non-authenticated
        public var userPreferred: String? {
          get {
            return resultMap["userPreferred"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "userPreferred")
          }
        }
      }

      public struct CoverImage: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaCoverImage"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("color", type: .scalar(String.self)),
            GraphQLField("extraLarge", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(color: String? = nil, extraLarge: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaCoverImage", "color": color, "extraLarge": extraLarge])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Average #hex color of cover image
        public var color: String? {
          get {
            return resultMap["color"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "color")
          }
        }

        /// The cover image url of the media at its largest size. If this size isn't available, large will be provided instead.
        public var extraLarge: String? {
          get {
            return resultMap["extraLarge"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "extraLarge")
          }
        }
      }

      public struct NextAiringEpisode: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AiringSchedule"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("episode", type: .nonNull(.scalar(Int.self))),
            GraphQLField("timeUntilAiring", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(episode: Int, timeUntilAiring: Int) {
          self.init(unsafeResultMap: ["__typename": "AiringSchedule", "episode": episode, "timeUntilAiring": timeUntilAiring])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The airing episode number
        public var episode: Int {
          get {
            return resultMap["episode"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "episode")
          }
        }

        /// Seconds until episode starts airing
        public var timeUntilAiring: Int {
          get {
            return resultMap["timeUntilAiring"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "timeUntilAiring")
          }
        }
      }

      public struct StartDate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FuzzyDate"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("day", type: .scalar(Int.self)),
            GraphQLField("year", type: .scalar(Int.self)),
            GraphQLField("month", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(day: Int? = nil, year: Int? = nil, month: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "FuzzyDate", "day": day, "year": year, "month": month])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Numeric Day (24)
        public var day: Int? {
          get {
            return resultMap["day"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "day")
          }
        }

        /// Numeric Year (2017)
        public var year: Int? {
          get {
            return resultMap["year"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "year")
          }
        }

        /// Numeric Month (3)
        public var month: Int? {
          get {
            return resultMap["month"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "month")
          }
        }
      }

      public struct EndDate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FuzzyDate"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("day", type: .scalar(Int.self)),
            GraphQLField("year", type: .scalar(Int.self)),
            GraphQLField("month", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(day: Int? = nil, year: Int? = nil, month: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "FuzzyDate", "day": day, "year": year, "month": month])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Numeric Day (24)
        public var day: Int? {
          get {
            return resultMap["day"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "day")
          }
        }

        /// Numeric Year (2017)
        public var year: Int? {
          get {
            return resultMap["year"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "year")
          }
        }

        /// Numeric Month (3)
        public var month: Int? {
          get {
            return resultMap["month"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "month")
          }
        }
      }
    }
  }
}
