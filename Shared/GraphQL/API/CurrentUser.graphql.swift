// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class CurrentUserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query CurrentUser {
      Viewer {
        __typename
        id
        name
        avatar {
          __typename
          large
        }
        options {
          __typename
          displayAdultContent
        }
        mediaListOptions {
          __typename
          scoreFormat
          animeList {
            __typename
            customLists
            advancedScoring
            advancedScoringEnabled
          }
          mangaList {
            __typename
            customLists
            advancedScoring
            advancedScoringEnabled
          }
        }
      }
    }
    """

  public let operationName: String = "CurrentUser"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Viewer", type: .object(Viewer.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(viewer: Viewer? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Viewer": viewer.flatMap { (value: Viewer) -> ResultMap in value.resultMap }])
    }

    /// Get the currently authenticated user
    public var viewer: Viewer? {
      get {
        return (resultMap["Viewer"] as? ResultMap).flatMap { Viewer(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Viewer")
      }
    }

    public struct Viewer: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatar", type: .object(Avatar.selections)),
          GraphQLField("options", type: .object(Option.selections)),
          GraphQLField("mediaListOptions", type: .object(MediaListOption.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String, avatar: Avatar? = nil, options: Option? = nil, mediaListOptions: MediaListOption? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }, "options": options.flatMap { (value: Option) -> ResultMap in value.resultMap }, "mediaListOptions": mediaListOptions.flatMap { (value: MediaListOption) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the user
      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The name of the user
      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// The user's avatar images
      public var avatar: Avatar? {
        get {
          return (resultMap["avatar"] as? ResultMap).flatMap { Avatar(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "avatar")
        }
      }

      /// The user's general options
      public var options: Option? {
        get {
          return (resultMap["options"] as? ResultMap).flatMap { Option(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "options")
        }
      }

      /// The user's media list options
      public var mediaListOptions: MediaListOption? {
        get {
          return (resultMap["mediaListOptions"] as? ResultMap).flatMap { MediaListOption(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "mediaListOptions")
        }
      }

      public struct Avatar: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["UserAvatar"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("large", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(large: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "UserAvatar", "large": large])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The avatar of user at its largest size
        public var large: String? {
          get {
            return resultMap["large"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "large")
          }
        }
      }

      public struct Option: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["UserOptions"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("displayAdultContent", type: .scalar(Bool.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(displayAdultContent: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "UserOptions", "displayAdultContent": displayAdultContent])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Whether the user has enabled viewing of 18+ content
        public var displayAdultContent: Bool? {
          get {
            return resultMap["displayAdultContent"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "displayAdultContent")
          }
        }
      }

      public struct MediaListOption: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaListOptions"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("scoreFormat", type: .scalar(ScoreFormat.self)),
            GraphQLField("animeList", type: .object(AnimeList.selections)),
            GraphQLField("mangaList", type: .object(MangaList.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(scoreFormat: ScoreFormat? = nil, animeList: AnimeList? = nil, mangaList: MangaList? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaListOptions", "scoreFormat": scoreFormat, "animeList": animeList.flatMap { (value: AnimeList) -> ResultMap in value.resultMap }, "mangaList": mangaList.flatMap { (value: MangaList) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The score format the user is using for media lists
        public var scoreFormat: ScoreFormat? {
          get {
            return resultMap["scoreFormat"] as? ScoreFormat
          }
          set {
            resultMap.updateValue(newValue, forKey: "scoreFormat")
          }
        }

        /// The user's anime list options
        public var animeList: AnimeList? {
          get {
            return (resultMap["animeList"] as? ResultMap).flatMap { AnimeList(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "animeList")
          }
        }

        /// The user's manga list options
        public var mangaList: MangaList? {
          get {
            return (resultMap["mangaList"] as? ResultMap).flatMap { MangaList(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "mangaList")
          }
        }

        public struct AnimeList: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MediaListTypeOptions"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("customLists", type: .list(.scalar(String.self))),
              GraphQLField("advancedScoring", type: .list(.scalar(String.self))),
              GraphQLField("advancedScoringEnabled", type: .scalar(Bool.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(customLists: [String?]? = nil, advancedScoring: [String?]? = nil, advancedScoringEnabled: Bool? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaListTypeOptions", "customLists": customLists, "advancedScoring": advancedScoring, "advancedScoringEnabled": advancedScoringEnabled])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The names of the user's custom lists
          public var customLists: [String?]? {
            get {
              return resultMap["customLists"] as? [String?]
            }
            set {
              resultMap.updateValue(newValue, forKey: "customLists")
            }
          }

          /// The names of the user's advanced scoring sections
          public var advancedScoring: [String?]? {
            get {
              return resultMap["advancedScoring"] as? [String?]
            }
            set {
              resultMap.updateValue(newValue, forKey: "advancedScoring")
            }
          }

          /// If advanced scoring is enabled
          public var advancedScoringEnabled: Bool? {
            get {
              return resultMap["advancedScoringEnabled"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "advancedScoringEnabled")
            }
          }
        }

        public struct MangaList: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MediaListTypeOptions"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("customLists", type: .list(.scalar(String.self))),
              GraphQLField("advancedScoring", type: .list(.scalar(String.self))),
              GraphQLField("advancedScoringEnabled", type: .scalar(Bool.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(customLists: [String?]? = nil, advancedScoring: [String?]? = nil, advancedScoringEnabled: Bool? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaListTypeOptions", "customLists": customLists, "advancedScoring": advancedScoring, "advancedScoringEnabled": advancedScoringEnabled])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The names of the user's custom lists
          public var customLists: [String?]? {
            get {
              return resultMap["customLists"] as? [String?]
            }
            set {
              resultMap.updateValue(newValue, forKey: "customLists")
            }
          }

          /// The names of the user's advanced scoring sections
          public var advancedScoring: [String?]? {
            get {
              return resultMap["advancedScoring"] as? [String?]
            }
            set {
              resultMap.updateValue(newValue, forKey: "advancedScoring")
            }
          }

          /// If advanced scoring is enabled
          public var advancedScoringEnabled: Bool? {
            get {
              return resultMap["advancedScoringEnabled"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "advancedScoringEnabled")
            }
          }
        }
      }
    }
  }
}
