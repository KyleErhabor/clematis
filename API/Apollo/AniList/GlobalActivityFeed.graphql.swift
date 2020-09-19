// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GlobalActivityFeedQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GlobalActivityFeed($page: Int!, $perPage: Int!) {
      Page(page: $page, perPage: $perPage) {
        __typename
        activities(sort: ID) {
          __typename
          ...textActivityFragment
          ...listActivityFragment
        }
      }
    }
    """

  public let operationName: String = "GlobalActivityFeed"

  public var queryDocument: String { return operationDefinition.appending("\n" + TextActivityFragment.fragmentDefinition).appending("\n" + ListActivityFragment.fragmentDefinition) }

  public var page: Int
  public var perPage: Int

  public init(page: Int, perPage: Int) {
    self.page = page
    self.perPage = perPage
  }

  public var variables: GraphQLMap? {
    return ["page": page, "perPage": perPage]
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
          GraphQLField("activities", arguments: ["sort": "ID"], type: .list(.object(Activity.selections))),
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
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(TextActivityFragment.self),
            GraphQLFragmentSpread(ListActivityFragment.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeMessageActivity() -> Activity {
          return Activity(unsafeResultMap: ["__typename": "MessageActivity"])
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

          public var textActivityFragment: TextActivityFragment? {
            get {
              if !TextActivityFragment.possibleTypes.contains(resultMap["__typename"]! as! String) { return nil }
              return TextActivityFragment(unsafeResultMap: resultMap)
            }
            set {
              guard let newValue = newValue else { return }
              resultMap += newValue.resultMap
            }
          }

          public var listActivityFragment: ListActivityFragment? {
            get {
              if !ListActivityFragment.possibleTypes.contains(resultMap["__typename"]! as! String) { return nil }
              return ListActivityFragment(unsafeResultMap: resultMap)
            }
            set {
              guard let newValue = newValue else { return }
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public struct TextActivityFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment textActivityFragment on TextActivity {
      __typename
      id
      type
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

  public static let possibleTypes: [String] = ["TextActivity"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      GraphQLField("type", type: .scalar(ActivityType.self)),
      GraphQLField("user", type: .object(User.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: Int, type: ActivityType? = nil, user: User? = nil) {
    self.init(unsafeResultMap: ["__typename": "TextActivity", "id": id, "type": type, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
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

  /// The type of activity
  public var type: ActivityType? {
    get {
      return resultMap["type"] as? ActivityType
    }
    set {
      resultMap.updateValue(newValue, forKey: "type")
    }
  }

  /// The user who created the activity
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

public struct ListActivityFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment listActivityFragment on ListActivity {
      __typename
      id
      type
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

  public static let possibleTypes: [String] = ["ListActivity"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      GraphQLField("type", type: .scalar(ActivityType.self)),
      GraphQLField("user", type: .object(User.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: Int, type: ActivityType? = nil, user: User? = nil) {
    self.init(unsafeResultMap: ["__typename": "ListActivity", "id": id, "type": type, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
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

  /// The type of activity
  public var type: ActivityType? {
    get {
      return resultMap["type"] as? ActivityType
    }
    set {
      resultMap.updateValue(newValue, forKey: "type")
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
