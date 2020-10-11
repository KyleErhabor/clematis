// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class UserActivityQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query UserActivity($page: Int!, $perPage: Int!, $userID: Int!) {
      Page(page: $page, perPage: $perPage) {
        __typename
        activities(userId: $userID, sort: ID_DESC) {
          __typename
          ... on ListActivity {
            id
            status
            isLiked
            isLocked
            progress
            createdAt
            isSubscribed
            likes {
              __typename
              name
            }
            replies {
              __typename
              id
              text(asHtml: true)
              likes {
                __typename
                name
              }
            }
            media {
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
          ... on TextActivity {
            id
          }
          ... on MessageActivity {
            id
          }
        }
      }
    }
    """

  public let operationName: String = "UserActivity"

  public var page: Int
  public var perPage: Int
  public var userID: Int

  public init(page: Int, perPage: Int, userID: Int) {
    self.page = page
    self.perPage = perPage
    self.userID = userID
  }

  public var variables: GraphQLMap? {
    return ["page": page, "perPage": perPage, "userID": userID]
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
          GraphQLField("activities", arguments: ["userId": GraphQLVariable("userID"), "sort": "ID_DESC"], type: .list(.object(Activity.selections))),
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
              variants: ["ListActivity": AsListActivity.selections, "TextActivity": AsTextActivity.selections, "MessageActivity": AsMessageActivity.selections],
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

        public static func makeListActivity(id: Int, status: String? = nil, isLiked: Bool? = nil, isLocked: Bool? = nil, progress: String? = nil, createdAt: Int, isSubscribed: Bool? = nil, likes: [AsListActivity.Like?]? = nil, replies: [AsListActivity.Reply?]? = nil, media: AsListActivity.Medium? = nil) -> Activity {
          return Activity(unsafeResultMap: ["__typename": "ListActivity", "id": id, "status": status, "isLiked": isLiked, "isLocked": isLocked, "progress": progress, "createdAt": createdAt, "isSubscribed": isSubscribed, "likes": likes.flatMap { (value: [AsListActivity.Like?]) -> [ResultMap?] in value.map { (value: AsListActivity.Like?) -> ResultMap? in value.flatMap { (value: AsListActivity.Like) -> ResultMap in value.resultMap } } }, "replies": replies.flatMap { (value: [AsListActivity.Reply?]) -> [ResultMap?] in value.map { (value: AsListActivity.Reply?) -> ResultMap? in value.flatMap { (value: AsListActivity.Reply) -> ResultMap in value.resultMap } } }, "media": media.flatMap { (value: AsListActivity.Medium) -> ResultMap in value.resultMap }])
        }

        public static func makeTextActivity(id: Int) -> Activity {
          return Activity(unsafeResultMap: ["__typename": "TextActivity", "id": id])
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
              GraphQLField("isLocked", type: .scalar(Bool.self)),
              GraphQLField("progress", type: .scalar(String.self)),
              GraphQLField("createdAt", type: .nonNull(.scalar(Int.self))),
              GraphQLField("isSubscribed", type: .scalar(Bool.self)),
              GraphQLField("likes", type: .list(.object(Like.selections))),
              GraphQLField("replies", type: .list(.object(Reply.selections))),
              GraphQLField("media", type: .object(Medium.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, status: String? = nil, isLiked: Bool? = nil, isLocked: Bool? = nil, progress: String? = nil, createdAt: Int, isSubscribed: Bool? = nil, likes: [Like?]? = nil, replies: [Reply?]? = nil, media: Medium? = nil) {
            self.init(unsafeResultMap: ["__typename": "ListActivity", "id": id, "status": status, "isLiked": isLiked, "isLocked": isLocked, "progress": progress, "createdAt": createdAt, "isSubscribed": isSubscribed, "likes": likes.flatMap { (value: [Like?]) -> [ResultMap?] in value.map { (value: Like?) -> ResultMap? in value.flatMap { (value: Like) -> ResultMap in value.resultMap } } }, "replies": replies.flatMap { (value: [Reply?]) -> [ResultMap?] in value.map { (value: Reply?) -> ResultMap? in value.flatMap { (value: Reply) -> ResultMap in value.resultMap } } }, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
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

          /// If the activity is locked and can receive replies
          public var isLocked: Bool? {
            get {
              return resultMap["isLocked"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isLocked")
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

          /// The time the activity was created at
          public var createdAt: Int {
            get {
              return resultMap["createdAt"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
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

          /// The users who liked the activity
          public var likes: [Like?]? {
            get {
              return (resultMap["likes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Like?] in value.map { (value: ResultMap?) -> Like? in value.flatMap { (value: ResultMap) -> Like in Like(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Like?]) -> [ResultMap?] in value.map { (value: Like?) -> ResultMap? in value.flatMap { (value: Like) -> ResultMap in value.resultMap } } }, forKey: "likes")
            }
          }

          /// The written replies to the activity
          public var replies: [Reply?]? {
            get {
              return (resultMap["replies"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Reply?] in value.map { (value: ResultMap?) -> Reply? in value.flatMap { (value: ResultMap) -> Reply in Reply(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Reply?]) -> [ResultMap?] in value.map { (value: Reply?) -> ResultMap? in value.flatMap { (value: Reply) -> ResultMap in value.resultMap } } }, forKey: "replies")
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

          public struct Like: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String) {
              self.init(unsafeResultMap: ["__typename": "User", "name": name])
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
          }

          public struct Reply: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ActivityReply"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("text", arguments: ["asHtml": true], type: .scalar(String.self)),
                GraphQLField("likes", type: .list(.object(Like.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, text: String? = nil, likes: [Like?]? = nil) {
              self.init(unsafeResultMap: ["__typename": "ActivityReply", "id": id, "text": text, "likes": likes.flatMap { (value: [Like?]) -> [ResultMap?] in value.map { (value: Like?) -> ResultMap? in value.flatMap { (value: Like) -> ResultMap in value.resultMap } } }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The id of the reply
            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The reply text
            public var text: String? {
              get {
                return resultMap["text"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "text")
              }
            }

            /// The users who liked the reply
            public var likes: [Like?]? {
              get {
                return (resultMap["likes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Like?] in value.map { (value: ResultMap?) -> Like? in value.flatMap { (value: ResultMap) -> Like in Like(unsafeResultMap: value) } } }
              }
              set {
                resultMap.updateValue(newValue.flatMap { (value: [Like?]) -> [ResultMap?] in value.map { (value: Like?) -> ResultMap? in value.flatMap { (value: Like) -> ResultMap in value.resultMap } } }, forKey: "likes")
              }
            }

            public struct Like: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["User"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(name: String) {
                self.init(unsafeResultMap: ["__typename": "User", "name": name])
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
            }
          }

          public struct Medium: GraphQLSelectionSet {
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
