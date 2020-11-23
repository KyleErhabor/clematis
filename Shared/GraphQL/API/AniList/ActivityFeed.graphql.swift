// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ActivityFeedQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ActivityFeed($page: Int!, $isFollowing: Boolean!, $hasRepliesOrTypeText: Boolean!) {
      Page(page: $page, perPage: 50) {
        __typename
        activities(isFollowing: $isFollowing, hasRepliesOrTypeText: $hasRepliesOrTypeText, sort: [ID_DESC]) {
          __typename
          ... on TextActivity {
            id
          }
          ... on ListActivity {
            id
            status
            isLiked
            siteUrl
            progress
            isLocked
            createdAt
            likeCount
            replyCount
            isSubscribed
            user {
              __typename
              id
              name
              avatar {
                __typename
                large
              }
            }
            media {
              __typename
              id
              coverImage {
                __typename
                color
                extraLarge
              }
              title {
                __typename
                userPreferred
              }
            }
          }
          ... on MessageActivity {
            id
          }
        }
      }
    }
    """

  public let operationName: String = "ActivityFeed"

  public var page: Int
  public var isFollowing: Bool
  public var hasRepliesOrTypeText: Bool

  public init(page: Int, isFollowing: Bool, hasRepliesOrTypeText: Bool) {
    self.page = page
    self.isFollowing = isFollowing
    self.hasRepliesOrTypeText = hasRepliesOrTypeText
  }

  public var variables: GraphQLMap? {
    return ["page": page, "isFollowing": isFollowing, "hasRepliesOrTypeText": hasRepliesOrTypeText]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Page", arguments: ["page": GraphQLVariable("page"), "perPage": 50], type: .object(Page.selections)),
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
          GraphQLField("activities", arguments: ["isFollowing": GraphQLVariable("isFollowing"), "hasRepliesOrTypeText": GraphQLVariable("hasRepliesOrTypeText"), "sort": ["ID_DESC"]], type: .list(.object(Activity.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(activities: [Activity?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Page", "activities": activities.flatMap { (value: [Activity?]) -> [ResultMap?] in value.map { (value: Activity?) -> ResultMap? in value.flatMap { (value: Activity) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var activities: [Activity?]? {
        get {
          return (resultMap["activities"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Activity?] in value.map { (value: ResultMap?) -> Activity? in value.flatMap { (value: ResultMap) -> Activity in Activity(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Activity?]) -> [ResultMap?] in value.map { (value: Activity?) -> ResultMap? in value.flatMap { (value: Activity) -> ResultMap in value.resultMap } } }, forKey: "activities")
        }
      }

      public struct Activity: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["TextActivity", "ListActivity", "MessageActivity"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLTypeCase(
              variants: ["TextActivity": AsTextActivity.selections, "ListActivity": AsListActivity.selections, "MessageActivity": AsMessageActivity.selections],
              default: [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              ]
            )
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeTextActivity(id: Int) -> Activity {
          return Activity(unsafeResultMap: ["__typename": "TextActivity", "id": id])
        }

        public static func makeListActivity(id: Int, status: String? = nil, isLiked: Bool? = nil, siteUrl: String? = nil, progress: String? = nil, isLocked: Bool? = nil, createdAt: Int, likeCount: Int, replyCount: Int, isSubscribed: Bool? = nil, user: AsListActivity.User? = nil, media: AsListActivity.Medium? = nil) -> Activity {
          return Activity(unsafeResultMap: ["__typename": "ListActivity", "id": id, "status": status, "isLiked": isLiked, "siteUrl": siteUrl, "progress": progress, "isLocked": isLocked, "createdAt": createdAt, "likeCount": likeCount, "replyCount": replyCount, "isSubscribed": isSubscribed, "user": user.flatMap { (value: AsListActivity.User) -> ResultMap in value.resultMap }, "media": media.flatMap { (value: AsListActivity.Medium) -> ResultMap in value.resultMap }])
        }

        public static func makeMessageActivity(id: Int) -> Activity {
          return Activity(unsafeResultMap: ["__typename": "MessageActivity", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var asTextActivity: AsTextActivity? {
          get {
            if !AsTextActivity.possibleTypes.contains(__typename) { return nil }
            return AsTextActivity(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsTextActivity: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["TextActivity"]

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
            self.init(unsafeResultMap: ["__typename": "TextActivity", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the activity
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }

        public var asListActivity: AsListActivity? {
          get {
            if !AsListActivity.possibleTypes.contains(__typename) { return nil }
            return AsListActivity(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsListActivity: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ListActivity"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("status", type: .scalar(String.self)),
              GraphQLField("isLiked", type: .scalar(Bool.self)),
              GraphQLField("siteUrl", type: .scalar(String.self)),
              GraphQLField("progress", type: .scalar(String.self)),
              GraphQLField("isLocked", type: .scalar(Bool.self)),
              GraphQLField("createdAt", type: .nonNull(.scalar(Int.self))),
              GraphQLField("likeCount", type: .nonNull(.scalar(Int.self))),
              GraphQLField("replyCount", type: .nonNull(.scalar(Int.self))),
              GraphQLField("isSubscribed", type: .scalar(Bool.self)),
              GraphQLField("user", type: .object(User.selections)),
              GraphQLField("media", type: .object(Medium.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, status: String? = nil, isLiked: Bool? = nil, siteUrl: String? = nil, progress: String? = nil, isLocked: Bool? = nil, createdAt: Int, likeCount: Int, replyCount: Int, isSubscribed: Bool? = nil, user: User? = nil, media: Medium? = nil) {
            self.init(unsafeResultMap: ["__typename": "ListActivity", "id": id, "status": status, "isLiked": isLiked, "siteUrl": siteUrl, "progress": progress, "isLocked": isLocked, "createdAt": createdAt, "likeCount": likeCount, "replyCount": replyCount, "isSubscribed": isSubscribed, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the activity
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The list item's textual status
          public var status: String? {
            get {
              return resultMap["status"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
            }
          }

          /// If the currently authenticated user liked the activity
          public var isLiked: Bool? {
            get {
              return resultMap["isLiked"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isLiked")
            }
          }

          /// The url for the activity page on the AniList website
          public var siteUrl: String? {
            get {
              return resultMap["siteUrl"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "siteUrl")
            }
          }

          /// The list progress made
          public var progress: String? {
            get {
              return resultMap["progress"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "progress")
            }
          }

          /// If the activity is locked and can receive replies
          public var isLocked: Bool? {
            get {
              return resultMap["isLocked"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isLocked")
            }
          }

          /// The time the activity was created at
          public var createdAt: Int {
            get {
              return resultMap["createdAt"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          /// The amount of likes the activity has
          public var likeCount: Int {
            get {
              return resultMap["likeCount"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "likeCount")
            }
          }

          /// The number of activity replies
          public var replyCount: Int {
            get {
              return resultMap["replyCount"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "replyCount")
            }
          }

          /// If the currently authenticated user is subscribed to the activity
          public var isSubscribed: Bool? {
            get {
              return resultMap["isSubscribed"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isSubscribed")
            }
          }

          /// The owner of the activity
          public var user: User? {
            get {
              return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "user")
            }
          }

          /// The associated media to the activity update
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

          public struct Medium: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Media"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("coverImage", type: .object(CoverImage.selections)),
                GraphQLField("title", type: .object(Title.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, coverImage: CoverImage? = nil, title: Title? = nil) {
              self.init(unsafeResultMap: ["__typename": "Media", "id": id, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }])
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

        public var asMessageActivity: AsMessageActivity? {
          get {
            if !AsMessageActivity.possibleTypes.contains(__typename) { return nil }
            return AsMessageActivity(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsMessageActivity: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MessageActivity"]

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
            self.init(unsafeResultMap: ["__typename": "MessageActivity", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the activity
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }
      }
    }
  }
}
