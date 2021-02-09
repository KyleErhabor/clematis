// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ForumsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Forums {
      Page {
        __typename
        threads(sort: [IS_STICKY, REPLIED_AT_DESC]) {
          __typename
          id
          title
          isLiked
          isLocked
          isSticky
          likeCount
          repliedAt
          viewCount
          replyCount
          isSubscribed
          body(asHtml: true)
          categories {
            __typename
            id
            name
          }
          mediaCategories {
            __typename
            id
            title {
              __typename
              userPreferred
            }
          }
          likes {
            __typename
            id
            name
            avatar {
              __typename
              large
            }
          }
          replyUser {
            __typename
            id
            name
            avatar {
              __typename
              large
            }
          }
        }
      }
    }
    """

  public let operationName: String = "Forums"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Page", type: .object(Page.selections)),
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
          GraphQLField("threads", arguments: ["sort": ["IS_STICKY", "REPLIED_AT_DESC"]], type: .list(.object(Thread.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(threads: [Thread?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Page", "threads": threads.flatMap { (value: [Thread?]) -> [ResultMap?] in value.map { (value: Thread?) -> ResultMap? in value.flatMap { (value: Thread) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var threads: [Thread?]? {
        get {
          return (resultMap["threads"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Thread?] in value.map { (value: ResultMap?) -> Thread? in value.flatMap { (value: ResultMap) -> Thread in Thread(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Thread?]) -> [ResultMap?] in value.map { (value: Thread?) -> ResultMap? in value.flatMap { (value: Thread) -> ResultMap in value.resultMap } } }, forKey: "threads")
        }
      }

      public struct Thread: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Thread"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("isLiked", type: .scalar(Bool.self)),
            GraphQLField("isLocked", type: .scalar(Bool.self)),
            GraphQLField("isSticky", type: .scalar(Bool.self)),
            GraphQLField("likeCount", type: .nonNull(.scalar(Int.self))),
            GraphQLField("repliedAt", type: .scalar(Int.self)),
            GraphQLField("viewCount", type: .scalar(Int.self)),
            GraphQLField("replyCount", type: .scalar(Int.self)),
            GraphQLField("isSubscribed", type: .scalar(Bool.self)),
            GraphQLField("body", arguments: ["asHtml": true], type: .scalar(String.self)),
            GraphQLField("categories", type: .list(.object(Category.selections))),
            GraphQLField("mediaCategories", type: .list(.object(MediaCategory.selections))),
            GraphQLField("likes", type: .list(.object(Like.selections))),
            GraphQLField("replyUser", type: .object(ReplyUser.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, title: String? = nil, isLiked: Bool? = nil, isLocked: Bool? = nil, isSticky: Bool? = nil, likeCount: Int, repliedAt: Int? = nil, viewCount: Int? = nil, replyCount: Int? = nil, isSubscribed: Bool? = nil, body: String? = nil, categories: [Category?]? = nil, mediaCategories: [MediaCategory?]? = nil, likes: [Like?]? = nil, replyUser: ReplyUser? = nil) {
          self.init(unsafeResultMap: ["__typename": "Thread", "id": id, "title": title, "isLiked": isLiked, "isLocked": isLocked, "isSticky": isSticky, "likeCount": likeCount, "repliedAt": repliedAt, "viewCount": viewCount, "replyCount": replyCount, "isSubscribed": isSubscribed, "body": body, "categories": categories.flatMap { (value: [Category?]) -> [ResultMap?] in value.map { (value: Category?) -> ResultMap? in value.flatMap { (value: Category) -> ResultMap in value.resultMap } } }, "mediaCategories": mediaCategories.flatMap { (value: [MediaCategory?]) -> [ResultMap?] in value.map { (value: MediaCategory?) -> ResultMap? in value.flatMap { (value: MediaCategory) -> ResultMap in value.resultMap } } }, "likes": likes.flatMap { (value: [Like?]) -> [ResultMap?] in value.map { (value: Like?) -> ResultMap? in value.flatMap { (value: Like) -> ResultMap in value.resultMap } } }, "replyUser": replyUser.flatMap { (value: ReplyUser) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the thread
        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The title of the thread
        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        /// If the currently authenticated user liked the thread
        public var isLiked: Bool? {
          get {
            return resultMap["isLiked"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isLiked")
          }
        }

        /// If the thread is locked and can receive comments
        public var isLocked: Bool? {
          get {
            return resultMap["isLocked"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isLocked")
          }
        }

        /// If the thread is stickied and should be displayed at the top of the page
        public var isSticky: Bool? {
          get {
            return resultMap["isSticky"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isSticky")
          }
        }

        /// The amount of likes the thread has
        public var likeCount: Int {
          get {
            return resultMap["likeCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "likeCount")
          }
        }

        /// The time of the last reply
        public var repliedAt: Int? {
          get {
            return resultMap["repliedAt"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "repliedAt")
          }
        }

        /// The number of times users have viewed the thread
        public var viewCount: Int? {
          get {
            return resultMap["viewCount"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "viewCount")
          }
        }

        /// The number of comments on the thread
        public var replyCount: Int? {
          get {
            return resultMap["replyCount"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "replyCount")
          }
        }

        /// If the currently authenticated user is subscribed to the thread
        public var isSubscribed: Bool? {
          get {
            return resultMap["isSubscribed"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isSubscribed")
          }
        }

        /// The text body of the thread (Markdown)
        public var body: String? {
          get {
            return resultMap["body"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "body")
          }
        }

        /// The categories of the thread
        public var categories: [Category?]? {
          get {
            return (resultMap["categories"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Category?] in value.map { (value: ResultMap?) -> Category? in value.flatMap { (value: ResultMap) -> Category in Category(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Category?]) -> [ResultMap?] in value.map { (value: Category?) -> ResultMap? in value.flatMap { (value: Category) -> ResultMap in value.resultMap } } }, forKey: "categories")
          }
        }

        /// The media categories of the thread
        public var mediaCategories: [MediaCategory?]? {
          get {
            return (resultMap["mediaCategories"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [MediaCategory?] in value.map { (value: ResultMap?) -> MediaCategory? in value.flatMap { (value: ResultMap) -> MediaCategory in MediaCategory(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [MediaCategory?]) -> [ResultMap?] in value.map { (value: MediaCategory?) -> ResultMap? in value.flatMap { (value: MediaCategory) -> ResultMap in value.resultMap } } }, forKey: "mediaCategories")
          }
        }

        /// The users who liked the thread
        public var likes: [Like?]? {
          get {
            return (resultMap["likes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Like?] in value.map { (value: ResultMap?) -> Like? in value.flatMap { (value: ResultMap) -> Like in Like(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Like?]) -> [ResultMap?] in value.map { (value: Like?) -> ResultMap? in value.flatMap { (value: Like) -> ResultMap in value.resultMap } } }, forKey: "likes")
          }
        }

        /// The user to last reply to the thread
        public var replyUser: ReplyUser? {
          get {
            return (resultMap["replyUser"] as? ResultMap).flatMap { ReplyUser(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "replyUser")
          }
        }

        public struct Category: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ThreadCategory"]

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
            self.init(unsafeResultMap: ["__typename": "ThreadCategory", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the category
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The name of the category
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct MediaCategory: GraphQLSelectionSet {
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

        public struct Like: GraphQLSelectionSet {
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

        public struct ReplyUser: GraphQLSelectionSet {
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
      }
    }
  }
}
