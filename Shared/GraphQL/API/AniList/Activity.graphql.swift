// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ActivityQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Activity($id: Int!) {
      Activity(id: $id) {
        __typename
        ... on ListActivity {
          isLiked
          isLocked
          createdAt
          isSubscribed
          status
          progress
          user {
            __typename
            name
            avatar {
              __typename
              large
            }
          }
          replies {
            __typename
            id
            isLiked
            createdAt
            text(asHtml: true)
            user {
              __typename
              name
              avatar {
                __typename
                large
              }
            }
            likes {
              __typename
              name
              avatar {
                __typename
                large
              }
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
    """

  public let operationName: String = "Activity"

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
        GraphQLField("Activity", arguments: ["id": GraphQLVariable("id")], type: .object(Activity.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(activity: Activity? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Activity": activity.flatMap { (value: Activity) -> ResultMap in value.resultMap }])
    }

    /// Activity query
    public var activity: Activity? {
      get {
        return (resultMap["Activity"] as? ResultMap).flatMap { Activity(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Activity")
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

      public static func makeListActivity(isLiked: Bool? = nil, isLocked: Bool? = nil, createdAt: Int, isSubscribed: Bool? = nil, status: String? = nil, progress: String? = nil, user: AsListActivity.User? = nil, replies: [AsListActivity.Reply?]? = nil) -> Activity {
        return Activity(unsafeResultMap: ["__typename": "ListActivity", "isLiked": isLiked, "isLocked": isLocked, "createdAt": createdAt, "isSubscribed": isSubscribed, "status": status, "progress": progress, "user": user.flatMap { (value: AsListActivity.User) -> ResultMap in value.resultMap }, "replies": replies.flatMap { (value: [AsListActivity.Reply?]) -> [ResultMap?] in value.map { (value: AsListActivity.Reply?) -> ResultMap? in value.flatMap { (value: AsListActivity.Reply) -> ResultMap in value.resultMap } } }])
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
            GraphQLField("isLiked", type: .scalar(Bool.self)),
            GraphQLField("isLocked", type: .scalar(Bool.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(Int.self))),
            GraphQLField("isSubscribed", type: .scalar(Bool.self)),
            GraphQLField("status", type: .scalar(String.self)),
            GraphQLField("progress", type: .scalar(String.self)),
            GraphQLField("user", type: .object(User.selections)),
            GraphQLField("replies", type: .list(.object(Reply.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(isLiked: Bool? = nil, isLocked: Bool? = nil, createdAt: Int, isSubscribed: Bool? = nil, status: String? = nil, progress: String? = nil, user: User? = nil, replies: [Reply?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "ListActivity", "isLiked": isLiked, "isLocked": isLocked, "createdAt": createdAt, "isSubscribed": isSubscribed, "status": status, "progress": progress, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "replies": replies.flatMap { (value: [Reply?]) -> [ResultMap?] in value.map { (value: Reply?) -> ResultMap? in value.flatMap { (value: Reply) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        /// The list item's textual status
        public var status: String? {
          get {
            return resultMap["status"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
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

        /// The owner of the activity
        public var user: User? {
          get {
            return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "user")
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

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["User"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("avatar", type: .object(Avatar.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, avatar: Avatar? = nil) {
            self.init(unsafeResultMap: ["__typename": "User", "name": name, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }])
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

        public struct Reply: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ActivityReply"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("isLiked", type: .scalar(Bool.self)),
              GraphQLField("createdAt", type: .nonNull(.scalar(Int.self))),
              GraphQLField("text", arguments: ["asHtml": true], type: .scalar(String.self)),
              GraphQLField("user", type: .object(User.selections)),
              GraphQLField("likes", type: .list(.object(Like.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, isLiked: Bool? = nil, createdAt: Int, text: String? = nil, user: User? = nil, likes: [Like?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "ActivityReply", "id": id, "isLiked": isLiked, "createdAt": createdAt, "text": text, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "likes": likes.flatMap { (value: [Like?]) -> [ResultMap?] in value.map { (value: Like?) -> ResultMap? in value.flatMap { (value: Like) -> ResultMap in value.resultMap } } }])
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

          /// If the currently authenticated user liked the reply
          public var isLiked: Bool? {
            get {
              return resultMap["isLiked"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isLiked")
            }
          }

          /// The time the reply was created at
          public var createdAt: Int {
            get {
              return resultMap["createdAt"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
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

          /// The user who created reply
          public var user: User? {
            get {
              return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "user")
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

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatar", type: .object(Avatar.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String, avatar: Avatar? = nil) {
              self.init(unsafeResultMap: ["__typename": "User", "name": name, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }])
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

          public struct Like: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatar", type: .object(Avatar.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String, avatar: Avatar? = nil) {
              self.init(unsafeResultMap: ["__typename": "User", "name": name, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }])
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
