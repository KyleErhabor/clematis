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
        id
        type
        idMal
        synonyms
        bannerImage
        isFavourite
        description(asHtml: true)
        coverImage {
          __typename
          color
          extraLarge
        }
        title {
          __typename
          native
          romaji
          english
          userPreferred
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
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("type", type: .scalar(MediaType.self)),
          GraphQLField("idMal", type: .scalar(Int.self)),
          GraphQLField("synonyms", type: .list(.scalar(String.self))),
          GraphQLField("bannerImage", type: .scalar(String.self)),
          GraphQLField("isFavourite", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("description", arguments: ["asHtml": true], type: .scalar(String.self)),
          GraphQLField("coverImage", type: .object(CoverImage.selections)),
          GraphQLField("title", type: .object(Title.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, type: MediaType? = nil, idMal: Int? = nil, synonyms: [String?]? = nil, bannerImage: String? = nil, isFavourite: Bool, description: String? = nil, coverImage: CoverImage? = nil, title: Title? = nil) {
        self.init(unsafeResultMap: ["__typename": "Media", "id": id, "type": type, "idMal": idMal, "synonyms": synonyms, "bannerImage": bannerImage, "isFavourite": isFavourite, "description": description, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }])
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

      /// The type of the media; anime or manga
      public var type: MediaType? {
        get {
          return resultMap["type"] as? MediaType
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      /// The mal id of the media
      public var idMal: Int? {
        get {
          return resultMap["idMal"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "idMal")
        }
      }

      /// Alternative titles of the media
      public var synonyms: [String?]? {
        get {
          return resultMap["synonyms"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "synonyms")
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

      /// Short description of the media's story and characters
      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
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

      /// The official titles of the media in various languages
      public var title: Title? {
        get {
          return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "title")
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

      public struct Title: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaTitle"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("native", type: .scalar(String.self)),
            GraphQLField("romaji", type: .scalar(String.self)),
            GraphQLField("english", type: .scalar(String.self)),
            GraphQLField("userPreferred", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(native: String? = nil, romaji: String? = nil, english: String? = nil, userPreferred: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaTitle", "native": native, "romaji": romaji, "english": english, "userPreferred": userPreferred])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Official title in it's native language
        public var native: String? {
          get {
            return resultMap["native"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "native")
          }
        }

        /// The romanization of the native language title
        public var romaji: String? {
          get {
            return resultMap["romaji"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "romaji")
          }
        }

        /// The official english title
        public var english: String? {
          get {
            return resultMap["english"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "english")
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
