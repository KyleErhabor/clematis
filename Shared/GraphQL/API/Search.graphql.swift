// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class SearchQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Search($search: String!) {
      anime: Page {
        __typename
        media(search: $search, type: ANIME) {
          __typename
          id
          format
          genres
          season
          episodes
          seasonYear
          status(version: 2)
          title {
            __typename
            userPreferred
          }
          coverImage {
            __typename
            color
            extraLarge
          }
        }
      }
      manga: Page {
        __typename
        media(search: $search, type: MANGA) {
          __typename
          id
          title {
            __typename
            userPreferred
          }
        }
      }
    }
    """

  public let operationName: String = "Search"

  public var search: String

  public init(search: String) {
    self.search = search
  }

  public var variables: GraphQLMap? {
    return ["search": search]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Page", alias: "anime", type: .object(Anime.selections)),
        GraphQLField("Page", alias: "manga", type: .object(Manga.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(anime: Anime? = nil, manga: Manga? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "anime": anime.flatMap { (value: Anime) -> ResultMap in value.resultMap }, "manga": manga.flatMap { (value: Manga) -> ResultMap in value.resultMap }])
    }

    public var anime: Anime? {
      get {
        return (resultMap["anime"] as? ResultMap).flatMap { Anime(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "anime")
      }
    }

    public var manga: Manga? {
      get {
        return (resultMap["manga"] as? ResultMap).flatMap { Manga(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "manga")
      }
    }

    public struct Anime: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Page"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("media", arguments: ["search": GraphQLVariable("search"), "type": "ANIME"], type: .list(.object(Medium.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(media: [Medium?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Page", "media": media.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var media: [Medium?]? {
        get {
          return (resultMap["media"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Medium?] in value.map { (value: ResultMap?) -> Medium? in value.flatMap { (value: ResultMap) -> Medium in Medium(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }, forKey: "media")
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("format", type: .scalar(MediaFormat.self)),
            GraphQLField("genres", type: .list(.scalar(String.self))),
            GraphQLField("season", type: .scalar(MediaSeason.self)),
            GraphQLField("episodes", type: .scalar(Int.self)),
            GraphQLField("seasonYear", type: .scalar(Int.self)),
            GraphQLField("status", arguments: ["version": 2], type: .scalar(MediaStatus.self)),
            GraphQLField("title", type: .object(Title.selections)),
            GraphQLField("coverImage", type: .object(CoverImage.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, format: MediaFormat? = nil, genres: [String?]? = nil, season: MediaSeason? = nil, episodes: Int? = nil, seasonYear: Int? = nil, status: MediaStatus? = nil, title: Title? = nil, coverImage: CoverImage? = nil) {
          self.init(unsafeResultMap: ["__typename": "Media", "id": id, "format": format, "genres": genres, "season": season, "episodes": episodes, "seasonYear": seasonYear, "status": status, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the media
        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
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

        /// The genres of the media
        public var genres: [String?]? {
          get {
            return resultMap["genres"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "genres")
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

        /// The amount of episodes the anime has when complete
        public var episodes: Int? {
          get {
            return resultMap["episodes"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "episodes")
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

        /// The current releasing status of the media
        public var status: MediaStatus? {
          get {
            return resultMap["status"] as? MediaStatus
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
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
      }
    }

    public struct Manga: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Page"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("media", arguments: ["search": GraphQLVariable("search"), "type": "MANGA"], type: .list(.object(Medium.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(media: [Medium?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Page", "media": media.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var media: [Medium?]? {
        get {
          return (resultMap["media"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Medium?] in value.map { (value: ResultMap?) -> Medium? in value.flatMap { (value: ResultMap) -> Medium in Medium(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }, forKey: "media")
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("title", type: .object(Title.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, title: Title? = nil) {
          self.init(unsafeResultMap: ["__typename": "Media", "id": id, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the media
        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
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
      }
    }
  }
}
