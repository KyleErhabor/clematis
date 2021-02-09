// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class UserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query User($id: Int!) {
      User(id: $id) {
        __typename
        name
        isBlocked
        updatedAt
        isFollower
        bannerImage
        donatorTier
        isFollowing
        donatorBadge
        moderatorStatus
        about(asHtml: true)
        avatar {
          __typename
          large
        }
        options {
          __typename
          profileColor
        }
        favourites {
          __typename
          anime {
            __typename
            pageInfo {
              __typename
              total
            }
            nodes {
              __typename
              id
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
          manga {
            __typename
            pageInfo {
              __typename
              total
            }
            nodes {
              __typename
              id
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
          characters {
            __typename
            pageInfo {
              __typename
              total
            }
            nodes {
              __typename
              id
              name {
                __typename
                full
              }
              image {
                __typename
                large
              }
            }
          }
          staff {
            __typename
            pageInfo {
              __typename
              total
            }
            nodes {
              __typename
              id
              name {
                __typename
                full
              }
              image {
                __typename
                large
              }
            }
          }
          studios {
            __typename
            pageInfo {
              __typename
              total
            }
            nodes {
              __typename
              id
              name
            }
          }
        }
      }
    }
    """

  public let operationName: String = "User"

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
        GraphQLField("User", arguments: ["id": GraphQLVariable("id")], type: .object(User.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "User": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
    }

    /// User query
    public var user: User? {
      get {
        return (resultMap["User"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "User")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("isBlocked", type: .scalar(Bool.self)),
          GraphQLField("updatedAt", type: .scalar(Int.self)),
          GraphQLField("isFollower", type: .scalar(Bool.self)),
          GraphQLField("bannerImage", type: .scalar(String.self)),
          GraphQLField("donatorTier", type: .scalar(Int.self)),
          GraphQLField("isFollowing", type: .scalar(Bool.self)),
          GraphQLField("donatorBadge", type: .scalar(String.self)),
          GraphQLField("moderatorStatus", type: .scalar(String.self)),
          GraphQLField("about", arguments: ["asHtml": true], type: .scalar(String.self)),
          GraphQLField("avatar", type: .object(Avatar.selections)),
          GraphQLField("options", type: .object(Option.selections)),
          GraphQLField("favourites", type: .object(Favourite.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, isBlocked: Bool? = nil, updatedAt: Int? = nil, isFollower: Bool? = nil, bannerImage: String? = nil, donatorTier: Int? = nil, isFollowing: Bool? = nil, donatorBadge: String? = nil, moderatorStatus: String? = nil, about: String? = nil, avatar: Avatar? = nil, options: Option? = nil, favourites: Favourite? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "name": name, "isBlocked": isBlocked, "updatedAt": updatedAt, "isFollower": isFollower, "bannerImage": bannerImage, "donatorTier": donatorTier, "isFollowing": isFollowing, "donatorBadge": donatorBadge, "moderatorStatus": moderatorStatus, "about": about, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }, "options": options.flatMap { (value: Option) -> ResultMap in value.resultMap }, "favourites": favourites.flatMap { (value: Favourite) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

      /// If the user is blocked by the authenticated user
      public var isBlocked: Bool? {
        get {
          return resultMap["isBlocked"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isBlocked")
        }
      }

      /// When the user's data was last updated
      public var updatedAt: Int? {
        get {
          return resultMap["updatedAt"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }

      /// If this user if following the authenticated user
      public var isFollower: Bool? {
        get {
          return resultMap["isFollower"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isFollower")
        }
      }

      /// The user's banner images
      public var bannerImage: String? {
        get {
          return resultMap["bannerImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "bannerImage")
        }
      }

      /// The donation tier of the user
      public var donatorTier: Int? {
        get {
          return resultMap["donatorTier"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "donatorTier")
        }
      }

      /// If the authenticated user if following this user
      public var isFollowing: Bool? {
        get {
          return resultMap["isFollowing"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isFollowing")
        }
      }

      /// Custom donation badge text
      public var donatorBadge: String? {
        get {
          return resultMap["donatorBadge"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "donatorBadge")
        }
      }

      /// If the user is a moderator or data moderator
      public var moderatorStatus: String? {
        get {
          return resultMap["moderatorStatus"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "moderatorStatus")
        }
      }

      /// The bio written by user (Markdown)
      public var about: String? {
        get {
          return resultMap["about"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "about")
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

      /// The users favourites
      public var favourites: Favourite? {
        get {
          return (resultMap["favourites"] as? ResultMap).flatMap { Favourite(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "favourites")
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
            GraphQLField("profileColor", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(profileColor: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "UserOptions", "profileColor": profileColor])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Profile highlight color (blue, purple, pink, orange, red, green, gray)
        public var profileColor: String? {
          get {
            return resultMap["profileColor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profileColor")
          }
        }
      }

      public struct Favourite: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Favourites"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("anime", type: .object(Anime.selections)),
            GraphQLField("manga", type: .object(Manga.selections)),
            GraphQLField("characters", type: .object(Character.selections)),
            GraphQLField("staff", type: .object(Staff.selections)),
            GraphQLField("studios", type: .object(Studio.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(anime: Anime? = nil, manga: Manga? = nil, characters: Character? = nil, staff: Staff? = nil, studios: Studio? = nil) {
          self.init(unsafeResultMap: ["__typename": "Favourites", "anime": anime.flatMap { (value: Anime) -> ResultMap in value.resultMap }, "manga": manga.flatMap { (value: Manga) -> ResultMap in value.resultMap }, "characters": characters.flatMap { (value: Character) -> ResultMap in value.resultMap }, "staff": staff.flatMap { (value: Staff) -> ResultMap in value.resultMap }, "studios": studios.flatMap { (value: Studio) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Favourite anime
        public var anime: Anime? {
          get {
            return (resultMap["anime"] as? ResultMap).flatMap { Anime(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "anime")
          }
        }

        /// Favourite manga
        public var manga: Manga? {
          get {
            return (resultMap["manga"] as? ResultMap).flatMap { Manga(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "manga")
          }
        }

        /// Favourite characters
        public var characters: Character? {
          get {
            return (resultMap["characters"] as? ResultMap).flatMap { Character(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "characters")
          }
        }

        /// Favourite staff
        public var staff: Staff? {
          get {
            return (resultMap["staff"] as? ResultMap).flatMap { Staff(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "staff")
          }
        }

        /// Favourite studios
        public var studios: Studio? {
          get {
            return (resultMap["studios"] as? ResultMap).flatMap { Studio(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "studios")
          }
        }

        public struct Anime: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MediaConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("pageInfo", type: .object(PageInfo.selections)),
              GraphQLField("nodes", type: .list(.object(Node.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(pageInfo: PageInfo? = nil, nodes: [Node?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaConnection", "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }, "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The pagination information
          public var pageInfo: PageInfo? {
            get {
              return (resultMap["pageInfo"] as? ResultMap).flatMap { PageInfo(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "pageInfo")
            }
          }

          public var nodes: [Node?]? {
            get {
              return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
            }
          }

          public struct PageInfo: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["PageInfo"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("total", type: .scalar(Int.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(total: Int? = nil) {
              self.init(unsafeResultMap: ["__typename": "PageInfo", "total": total])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The total number of items
            public var total: Int? {
              get {
                return resultMap["total"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "total")
              }
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Media"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("title", type: .object(Title.selections)),
                GraphQLField("coverImage", type: .object(CoverImage.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, title: Title? = nil, coverImage: CoverImage? = nil) {
              self.init(unsafeResultMap: ["__typename": "Media", "id": id, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }])
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
          public static let possibleTypes: [String] = ["MediaConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("pageInfo", type: .object(PageInfo.selections)),
              GraphQLField("nodes", type: .list(.object(Node.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(pageInfo: PageInfo? = nil, nodes: [Node?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaConnection", "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }, "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The pagination information
          public var pageInfo: PageInfo? {
            get {
              return (resultMap["pageInfo"] as? ResultMap).flatMap { PageInfo(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "pageInfo")
            }
          }

          public var nodes: [Node?]? {
            get {
              return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
            }
          }

          public struct PageInfo: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["PageInfo"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("total", type: .scalar(Int.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(total: Int? = nil) {
              self.init(unsafeResultMap: ["__typename": "PageInfo", "total": total])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The total number of items
            public var total: Int? {
              get {
                return resultMap["total"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "total")
              }
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Media"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("title", type: .object(Title.selections)),
                GraphQLField("coverImage", type: .object(CoverImage.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, title: Title? = nil, coverImage: CoverImage? = nil) {
              self.init(unsafeResultMap: ["__typename": "Media", "id": id, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }])
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

        public struct Character: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["CharacterConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("pageInfo", type: .object(PageInfo.selections)),
              GraphQLField("nodes", type: .list(.object(Node.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(pageInfo: PageInfo? = nil, nodes: [Node?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "CharacterConnection", "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }, "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The pagination information
          public var pageInfo: PageInfo? {
            get {
              return (resultMap["pageInfo"] as? ResultMap).flatMap { PageInfo(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "pageInfo")
            }
          }

          public var nodes: [Node?]? {
            get {
              return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
            }
          }

          public struct PageInfo: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["PageInfo"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("total", type: .scalar(Int.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(total: Int? = nil) {
              self.init(unsafeResultMap: ["__typename": "PageInfo", "total": total])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The total number of items
            public var total: Int? {
              get {
                return resultMap["total"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "total")
              }
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Character"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("name", type: .object(Name.selections)),
                GraphQLField("image", type: .object(Image.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, name: Name? = nil, image: Image? = nil) {
              self.init(unsafeResultMap: ["__typename": "Character", "id": id, "name": name.flatMap { (value: Name) -> ResultMap in value.resultMap }, "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The id of the character
            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The names of the character
            public var name: Name? {
              get {
                return (resultMap["name"] as? ResultMap).flatMap { Name(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "name")
              }
            }

            /// Character images
            public var image: Image? {
              get {
                return (resultMap["image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "image")
              }
            }

            public struct Name: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["CharacterName"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("full", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(full: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "CharacterName", "full": full])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The character's full name
              public var full: String? {
                get {
                  return resultMap["full"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "full")
                }
              }
            }

            public struct Image: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["CharacterImage"]

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
                self.init(unsafeResultMap: ["__typename": "CharacterImage", "large": large])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The character's image of media at its largest size
              public var large: String? {
                get {
                  return resultMap["large"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "large")
                }
              }
            }
          }
        }

        public struct Staff: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["StaffConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("pageInfo", type: .object(PageInfo.selections)),
              GraphQLField("nodes", type: .list(.object(Node.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(pageInfo: PageInfo? = nil, nodes: [Node?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "StaffConnection", "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }, "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The pagination information
          public var pageInfo: PageInfo? {
            get {
              return (resultMap["pageInfo"] as? ResultMap).flatMap { PageInfo(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "pageInfo")
            }
          }

          public var nodes: [Node?]? {
            get {
              return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
            }
          }

          public struct PageInfo: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["PageInfo"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("total", type: .scalar(Int.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(total: Int? = nil) {
              self.init(unsafeResultMap: ["__typename": "PageInfo", "total": total])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The total number of items
            public var total: Int? {
              get {
                return resultMap["total"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "total")
              }
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Staff"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("name", type: .object(Name.selections)),
                GraphQLField("image", type: .object(Image.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, name: Name? = nil, image: Image? = nil) {
              self.init(unsafeResultMap: ["__typename": "Staff", "id": id, "name": name.flatMap { (value: Name) -> ResultMap in value.resultMap }, "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The id of the staff member
            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The names of the staff member
            public var name: Name? {
              get {
                return (resultMap["name"] as? ResultMap).flatMap { Name(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "name")
              }
            }

            /// The staff images
            public var image: Image? {
              get {
                return (resultMap["image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "image")
              }
            }

            public struct Name: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["StaffName"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("full", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(full: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "StaffName", "full": full])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The person's full name
              public var full: String? {
                get {
                  return resultMap["full"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "full")
                }
              }
            }

            public struct Image: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["StaffImage"]

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
                self.init(unsafeResultMap: ["__typename": "StaffImage", "large": large])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The person's image of media at its largest size
              public var large: String? {
                get {
                  return resultMap["large"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "large")
                }
              }
            }
          }
        }

        public struct Studio: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["StudioConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("pageInfo", type: .object(PageInfo.selections)),
              GraphQLField("nodes", type: .list(.object(Node.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(pageInfo: PageInfo? = nil, nodes: [Node?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "StudioConnection", "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }, "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The pagination information
          public var pageInfo: PageInfo? {
            get {
              return (resultMap["pageInfo"] as? ResultMap).flatMap { PageInfo(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "pageInfo")
            }
          }

          public var nodes: [Node?]? {
            get {
              return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
            }
          }

          public struct PageInfo: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["PageInfo"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("total", type: .scalar(Int.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(total: Int? = nil) {
              self.init(unsafeResultMap: ["__typename": "PageInfo", "total": total])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The total number of items
            public var total: Int? {
              get {
                return resultMap["total"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "total")
              }
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Studio"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, name: String) {
              self.init(unsafeResultMap: ["__typename": "Studio", "id": id, "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The id of the studio
            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The name of the studio
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }
        }
      }
    }
  }
}
// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct UserPreviewFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment userPreviewFragment on User {
      __typename
      id
      name
      avatar {
        __typename
        large
      }
    }
    """

  public static let possibleTypes: [String] = ["User"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("avatar", type: .object(Avatar.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: Int, name: String, avatar: Avatar? = nil) {
    self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }])
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
}
