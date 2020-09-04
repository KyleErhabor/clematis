// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class TrendingMediaQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query TrendingMedia($page: Int, $perPage: Int = 25, $type: MediaType!) {
      Page(page: $page, perPage: $perPage) {
        __typename
        media(type: $type, sort: [TRENDING_DESC, POPULARITY_DESC]) {
          __typename
          id
          siteUrl
          title {
            __typename
            userPreferred
          }
          coverImage {
            __typename
            extraLarge
            color
          }
        }
      }
    }
    """

  public let operationName: String = "TrendingMedia"

  public var page: Int?
  public var perPage: Int?
  public var type: MediaType

  public init(page: Int? = nil, perPage: Int? = nil, type: MediaType) {
    self.page = page
    self.perPage = perPage
    self.type = type
  }

  public var variables: GraphQLMap? {
    return ["page": page, "perPage": perPage, "type": type]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Page", arguments: ["page": GraphQLVariable("page"), "perPage": GraphQLVariable("perPage")], type: .object(Page.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(page: Page? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Page": page.flatMap { (value: Page) -> ResultMap in value.resultMap }])
    }

    public var page: Page? {
      get {
        return (resultMap["Page"] as? ResultMap).flatMap { Page(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Page")
      }
    }

    public struct Page: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Page"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("media", arguments: ["type": GraphQLVariable("type"), "sort": ["TRENDING_DESC", "POPULARITY_DESC"]], type: .list(.object(Medium.selections))),
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
            GraphQLField("siteUrl", type: .scalar(String.self)),
            GraphQLField("title", type: .object(Title.selections)),
            GraphQLField("coverImage", type: .object(CoverImage.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, siteUrl: String? = nil, title: Title? = nil, coverImage: CoverImage? = nil) {
          self.init(unsafeResultMap: ["__typename": "Media", "id": id, "siteUrl": siteUrl, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }])
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

        /// The url for the media page on the AniList website
        public var siteUrl: String? {
          get {
            return resultMap["siteUrl"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "siteUrl")
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
              GraphQLField("extraLarge", type: .scalar(String.self)),
              GraphQLField("color", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(extraLarge: String? = nil, color: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaCoverImage", "extraLarge": extraLarge, "color": color])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
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

          /// Average #hex color of cover image
          public var color: String? {
            get {
              return resultMap["color"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "color")
            }
          }
        }
      }
    }
  }
}
