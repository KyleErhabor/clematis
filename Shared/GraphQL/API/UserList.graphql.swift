// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class UserListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query UserList($id: Int!, $type: MediaType!, $chunk: Int!) {
      MediaListCollection(userId: $id, type: $type, chunk: $chunk) {
        __typename
        hasNextChunk
        lists {
          __typename
          name
          entries {
            __typename
            id
            progress
            progressVolumes
            user {
              __typename
              id
            }
            media {
              __typename
              id
              volumes
              chapters
              episodes
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
        }
      }
    }
    """

  public let operationName: String = "UserList"

  public var id: Int
  public var type: MediaType
  public var chunk: Int

  public init(id: Int, type: MediaType, chunk: Int) {
    self.id = id
    self.type = type
    self.chunk = chunk
  }

  public var variables: GraphQLMap? {
    return ["id": id, "type": type, "chunk": chunk]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("MediaListCollection", arguments: ["userId": GraphQLVariable("id"), "type": GraphQLVariable("type"), "chunk": GraphQLVariable("chunk")], type: .object(MediaListCollection.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(mediaListCollection: MediaListCollection? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "MediaListCollection": mediaListCollection.flatMap { (value: MediaListCollection) -> ResultMap in value.resultMap }])
    }

    /// Media list collection query, provides list pre-grouped by status & custom lists. User ID and Media Type arguments required.
    public var mediaListCollection: MediaListCollection? {
      get {
        return (resultMap["MediaListCollection"] as? ResultMap).flatMap { MediaListCollection(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "MediaListCollection")
      }
    }

    public struct MediaListCollection: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MediaListCollection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("hasNextChunk", type: .scalar(Bool.self)),
          GraphQLField("lists", type: .list(.object(List.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(hasNextChunk: Bool? = nil, lists: [List?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "MediaListCollection", "hasNextChunk": hasNextChunk, "lists": lists.flatMap { (value: [List?]) -> [ResultMap?] in value.map { (value: List?) -> ResultMap? in value.flatMap { (value: List) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// If there is another chunk
      public var hasNextChunk: Bool? {
        get {
          return resultMap["hasNextChunk"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "hasNextChunk")
        }
      }

      /// Grouped media list entries
      public var lists: [List?]? {
        get {
          return (resultMap["lists"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [List?] in value.map { (value: ResultMap?) -> List? in value.flatMap { (value: ResultMap) -> List in List(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [List?]) -> [ResultMap?] in value.map { (value: List?) -> ResultMap? in value.flatMap { (value: List) -> ResultMap in value.resultMap } } }, forKey: "lists")
        }
      }

      public struct List: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaListGroup"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("entries", type: .list(.object(Entry.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, entries: [Entry?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaListGroup", "name": name, "entries": entries.flatMap { (value: [Entry?]) -> [ResultMap?] in value.map { (value: Entry?) -> ResultMap? in value.flatMap { (value: Entry) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// Media list entries
        public var entries: [Entry?]? {
          get {
            return (resultMap["entries"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Entry?] in value.map { (value: ResultMap?) -> Entry? in value.flatMap { (value: ResultMap) -> Entry in Entry(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Entry?]) -> [ResultMap?] in value.map { (value: Entry?) -> ResultMap? in value.flatMap { (value: Entry) -> ResultMap in value.resultMap } } }, forKey: "entries")
          }
        }

        public struct Entry: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MediaList"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("progress", type: .scalar(Int.self)),
              GraphQLField("progressVolumes", type: .scalar(Int.self)),
              GraphQLField("user", type: .object(User.selections)),
              GraphQLField("media", type: .object(Medium.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, progress: Int? = nil, progressVolumes: Int? = nil, user: User? = nil, media: Medium? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaList", "id": id, "progress": progress, "progressVolumes": progressVolumes, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the list entry
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The amount of episodes/chapters consumed by the user
          public var progress: Int? {
            get {
              return resultMap["progress"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "progress")
            }
          }

          /// The amount of volumes read by the user
          public var progressVolumes: Int? {
            get {
              return resultMap["progressVolumes"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "progressVolumes")
            }
          }

          public var user: User? {
            get {
              return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "user")
            }
          }

          public var media: Medium? {
            get {
              return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "media")
            }
          }

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int) {
              self.init(unsafeResultMap: ["__typename": "User", "id": id])
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
          }

          public struct Medium: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Media"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("volumes", type: .scalar(Int.self)),
                GraphQLField("chapters", type: .scalar(Int.self)),
                GraphQLField("episodes", type: .scalar(Int.self)),
                GraphQLField("title", type: .object(Title.selections)),
                GraphQLField("coverImage", type: .object(CoverImage.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, volumes: Int? = nil, chapters: Int? = nil, episodes: Int? = nil, title: Title? = nil, coverImage: CoverImage? = nil) {
              self.init(unsafeResultMap: ["__typename": "Media", "id": id, "volumes": volumes, "chapters": chapters, "episodes": episodes, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }])
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

            /// The amount of episodes the anime has when complete
            public var episodes: Int? {
              get {
                return resultMap["episodes"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "episodes")
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
      }
    }
  }
}
