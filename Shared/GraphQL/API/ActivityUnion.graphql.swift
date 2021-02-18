// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct ListActivityFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment listActivityFragment on ListActivity {
      __typename
      id
      status
      isLiked
      isLocked
      progress
      createdAt
      likeCount
      replyCount
      isSubscribed
      user {
        __typename
        ...userPreviewFragment
      }
      likes {
        __typename
        ...userPreviewFragment
      }
      media {
        __typename
        id
        type
        isLocked
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
    """

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
      GraphQLField("likeCount", type: .nonNull(.scalar(Int.self))),
      GraphQLField("replyCount", type: .nonNull(.scalar(Int.self))),
      GraphQLField("isSubscribed", type: .scalar(Bool.self)),
      GraphQLField("user", type: .object(User.selections)),
      GraphQLField("likes", type: .list(.object(Like.selections))),
      GraphQLField("media", type: .object(Medium.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: Int, status: String? = nil, isLiked: Bool? = nil, isLocked: Bool? = nil, progress: String? = nil, createdAt: Int, likeCount: Int, replyCount: Int, isSubscribed: Bool? = nil, user: User? = nil, likes: [Like?]? = nil, media: Medium? = nil) {
    self.init(unsafeResultMap: ["__typename": "ListActivity", "id": id, "status": status, "isLiked": isLiked, "isLocked": isLocked, "progress": progress, "createdAt": createdAt, "likeCount": likeCount, "replyCount": replyCount, "isSubscribed": isSubscribed, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "likes": likes.flatMap { (value: [Like?]) -> [ResultMap?] in value.map { (value: Like?) -> ResultMap? in value.flatMap { (value: Like) -> ResultMap in value.resultMap } } }, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
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

  /// The users who liked the activity
  public var likes: [Like?]? {
    get {
      return (resultMap["likes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Like?] in value.map { (value: ResultMap?) -> Like? in value.flatMap { (value: ResultMap) -> Like in Like(unsafeResultMap: value) } } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [Like?]) -> [ResultMap?] in value.map { (value: Like?) -> ResultMap? in value.flatMap { (value: Like) -> ResultMap in value.resultMap } } }, forKey: "likes")
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
        GraphQLFragmentSpread(UserPreviewFragment.self),
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

      public var userPreviewFragment: UserPreviewFragment {
        get {
          return UserPreviewFragment(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }

  public struct Like: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["User"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(UserPreviewFragment.self),
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

      public var userPreviewFragment: UserPreviewFragment {
        get {
          return UserPreviewFragment(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
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
        GraphQLField("type", type: .scalar(MediaType.self)),
        GraphQLField("isLocked", type: .scalar(Bool.self)),
        GraphQLField("title", type: .object(Title.selections)),
        GraphQLField("coverImage", type: .object(CoverImage.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: Int, type: MediaType? = nil, isLocked: Bool? = nil, title: Title? = nil, coverImage: CoverImage? = nil) {
      self.init(unsafeResultMap: ["__typename": "Media", "id": id, "type": type, "isLocked": isLocked, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }])
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

    /// The type of the media; anime or manga
    public var type: MediaType? {
      get {
        return resultMap["type"] as? MediaType
      }
      set {
        resultMap.updateValue(newValue, forKey: "type")
      }
    }

    /// Locked media may not be added to lists our favorited. This may be due to the entry pending for deletion or other reasons.
    public var isLocked: Bool? {
      get {
        return resultMap["isLocked"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "isLocked")
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

public struct TextActivityFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment textActivityFragment on TextActivity {
      __typename
      id
      isLiked
      createdAt
      likeCount
      replyCount
      isSubscribed
      text(asHtml: true)
      user {
        __typename
        ...userPreviewFragment
      }
      likes {
        __typename
        ...userPreviewFragment
      }
    }
    """

  public static let possibleTypes: [String] = ["TextActivity"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      GraphQLField("isLiked", type: .scalar(Bool.self)),
      GraphQLField("createdAt", type: .nonNull(.scalar(Int.self))),
      GraphQLField("likeCount", type: .nonNull(.scalar(Int.self))),
      GraphQLField("replyCount", type: .nonNull(.scalar(Int.self))),
      GraphQLField("isSubscribed", type: .scalar(Bool.self)),
      GraphQLField("text", arguments: ["asHtml": true], type: .scalar(String.self)),
      GraphQLField("user", type: .object(User.selections)),
      GraphQLField("likes", type: .list(.object(Like.selections))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: Int, isLiked: Bool? = nil, createdAt: Int, likeCount: Int, replyCount: Int, isSubscribed: Bool? = nil, text: String? = nil, user: User? = nil, likes: [Like?]? = nil) {
    self.init(unsafeResultMap: ["__typename": "TextActivity", "id": id, "isLiked": isLiked, "createdAt": createdAt, "likeCount": likeCount, "replyCount": replyCount, "isSubscribed": isSubscribed, "text": text, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "likes": likes.flatMap { (value: [Like?]) -> [ResultMap?] in value.map { (value: Like?) -> ResultMap? in value.flatMap { (value: Like) -> ResultMap in value.resultMap } } }])
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

  /// If the currently authenticated user liked the activity
  public var isLiked: Bool? {
    get {
      return resultMap["isLiked"] as? Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "isLiked")
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

  /// The status text (Markdown)
  public var text: String? {
    get {
      return resultMap["text"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "text")
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

  /// The users who liked the activity
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
        GraphQLFragmentSpread(UserPreviewFragment.self),
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

      public var userPreviewFragment: UserPreviewFragment {
        get {
          return UserPreviewFragment(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }

  public struct Like: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["User"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(UserPreviewFragment.self),
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

      public var userPreviewFragment: UserPreviewFragment {
        get {
          return UserPreviewFragment(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct MessageActivityFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment messageActivityFragment on MessageActivity {
      __typename
      id
    }
    """

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
