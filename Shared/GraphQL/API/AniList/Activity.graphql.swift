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
          replies {
            __typename
            ...activityReplyFragment
          }
        }
        ... on TextActivity {
          replies {
            __typename
            ...activityReplyFragment
          }
        }
        ... on MessageActivity {
          replies {
            __typename
            ...activityReplyFragment
          }
        }
      }
    }
    """

  public let operationName: String = "Activity"

  public var queryDocument: String { return operationDefinition.appending("\n" + ActivityReplyFragment.fragmentDefinition) }

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

      public static func makeListActivity(replies: [AsListActivity.Reply?]? = nil) -> Activity {
        return Activity(unsafeResultMap: ["__typename": "ListActivity", "replies": replies.flatMap { (value: [AsListActivity.Reply?]) -> [ResultMap?] in value.map { (value: AsListActivity.Reply?) -> ResultMap? in value.flatMap { (value: AsListActivity.Reply) -> ResultMap in value.resultMap } } }])
      }

      public static func makeTextActivity(replies: [AsTextActivity.Reply?]? = nil) -> Activity {
        return Activity(unsafeResultMap: ["__typename": "TextActivity", "replies": replies.flatMap { (value: [AsTextActivity.Reply?]) -> [ResultMap?] in value.map { (value: AsTextActivity.Reply?) -> ResultMap? in value.flatMap { (value: AsTextActivity.Reply) -> ResultMap in value.resultMap } } }])
      }

      public static func makeMessageActivity(replies: [AsMessageActivity.Reply?]? = nil) -> Activity {
        return Activity(unsafeResultMap: ["__typename": "MessageActivity", "replies": replies.flatMap { (value: [AsMessageActivity.Reply?]) -> [ResultMap?] in value.map { (value: AsMessageActivity.Reply?) -> ResultMap? in value.flatMap { (value: AsMessageActivity.Reply) -> ResultMap in value.resultMap } } }])
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
            GraphQLField("replies", type: .list(.object(Reply.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(replies: [Reply?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "ListActivity", "replies": replies.flatMap { (value: [Reply?]) -> [ResultMap?] in value.map { (value: Reply?) -> ResultMap? in value.flatMap { (value: Reply) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public struct Reply: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ActivityReply"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(ActivityReplyFragment.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var activityReplyFragment: ActivityReplyFragment {
              get {
                return ActivityReplyFragment(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
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
            GraphQLField("replies", type: .list(.object(Reply.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(replies: [Reply?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "TextActivity", "replies": replies.flatMap { (value: [Reply?]) -> [ResultMap?] in value.map { (value: Reply?) -> ResultMap? in value.flatMap { (value: Reply) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public struct Reply: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ActivityReply"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(ActivityReplyFragment.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var activityReplyFragment: ActivityReplyFragment {
              get {
                return ActivityReplyFragment(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
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
            GraphQLField("replies", type: .list(.object(Reply.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(replies: [Reply?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "MessageActivity", "replies": replies.flatMap { (value: [Reply?]) -> [ResultMap?] in value.map { (value: Reply?) -> ResultMap? in value.flatMap { (value: Reply) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public struct Reply: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ActivityReply"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(ActivityReplyFragment.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var activityReplyFragment: ActivityReplyFragment {
              get {
                return ActivityReplyFragment(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }
}

public struct ActivityReplyFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment activityReplyFragment on ActivityReply {
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
    }
    """

  public static let possibleTypes: [String] = ["ActivityReply"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      GraphQLField("isLiked", type: .scalar(Bool.self)),
      GraphQLField("createdAt", type: .nonNull(.scalar(Int.self))),
      GraphQLField("text", arguments: ["asHtml": true], type: .scalar(String.self)),
      GraphQLField("user", type: .object(User.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: Int, isLiked: Bool? = nil, createdAt: Int, text: String? = nil, user: User? = nil) {
    self.init(unsafeResultMap: ["__typename": "ActivityReply", "id": id, "isLiked": isLiked, "createdAt": createdAt, "text": text, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
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
}
