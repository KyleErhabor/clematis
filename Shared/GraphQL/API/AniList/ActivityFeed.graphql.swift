// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ActivityFeedQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ActivityFeed($page: Int!, $perPage: Int!) {
      Page(page: $page, perPage: $perPage) {
        __typename
        activities(hasRepliesOrTypeText: true, type_in: [TEXT, ANIME_LIST, MANGA_LIST], sort: ID_DESC) {
          __typename
          ...textActivityFragment
          ...listActivityFragment
        }
      }
    }
    """

  public let operationName: String = "ActivityFeed"

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
          GraphQLField("activities", arguments: ["hasRepliesOrTypeText": true, "type_in": ["TEXT", "ANIME_LIST", "MANGA_LIST"], "sort": "ID_DESC"], type: .list(.object(Activity.selections))),
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
      siteUrl
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
      GraphQLField("siteUrl", type: .scalar(String.self)),
      GraphQLField("user", type: .object(User.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: Int, type: ActivityType? = nil, siteUrl: String? = nil, user: User? = nil) {
    self.init(unsafeResultMap: ["__typename": "TextActivity", "id": id, "type": type, "siteUrl": siteUrl, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
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

  /// The url for the activity page on the AniList website
  public var siteUrl: String? {
    get {
      return resultMap["siteUrl"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "siteUrl")
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
      status
      progress
      createdAt
      likeCount
      replyCount
      media {
        __typename
        isAdult
        title {
          __typename
          userPreferred
        }
        coverImage {
          __typename
          extraLarge
          color
        }
      }
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
      GraphQLField("status", type: .scalar(String.self)),
      GraphQLField("progress", type: .scalar(String.self)),
      GraphQLField("createdAt", type: .nonNull(.scalar(Int.self))),
      GraphQLField("likeCount", type: .nonNull(.scalar(Int.self))),
      GraphQLField("replyCount", type: .nonNull(.scalar(Int.self))),
      GraphQLField("media", type: .object(Medium.selections)),
      GraphQLField("user", type: .object(User.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: Int, status: String? = nil, progress: String? = nil, createdAt: Int, likeCount: Int, replyCount: Int, media: Medium? = nil, user: User? = nil) {
    self.init(unsafeResultMap: ["__typename": "ListActivity", "id": id, "status": status, "progress": progress, "createdAt": createdAt, "likeCount": likeCount, "replyCount": replyCount, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
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

  /// The associated media to the activity update
  public var media: Medium? {
    get {
      return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "media")
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

  public struct Medium: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Media"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("isAdult", type: .scalar(Bool.self)),
        GraphQLField("title", type: .object(Title.selections)),
        GraphQLField("coverImage", type: .object(CoverImage.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(isAdult: Bool? = nil, title: Title? = nil, coverImage: CoverImage? = nil) {
      self.init(unsafeResultMap: ["__typename": "Media", "isAdult": isAdult, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// If the media is intended only for 18+ adult audiences
    public var isAdult: Bool? {
      get {
        return resultMap["isAdult"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "isAdult")
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
          GraphQLField("extraLarge", type: .scalar(String.self)),
          GraphQLField("color", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(extraLarge: String? = nil, color: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "MediaCoverImage", "extraLarge": extraLarge, "color": color])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

      /// Average #hex color of cover image
      public var color: String? {
        get {
          return resultMap["color"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "color")
        }
      }
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
