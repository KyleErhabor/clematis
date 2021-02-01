// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct ActivityReplyFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment activityReplyFragment on ActivityReply {
      __typename
      id
      isLiked
      createdAt
      likeCount
      text(asHtml: true)
      user {
        __typename
        id
        name
        avatar {
          __typename
          large
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
    }
    """

  public static let possibleTypes: [String] = ["ActivityReply"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      GraphQLField("isLiked", type: .scalar(Bool.self)),
      GraphQLField("createdAt", type: .nonNull(.scalar(Int.self))),
      GraphQLField("likeCount", type: .nonNull(.scalar(Int.self))),
      GraphQLField("text", arguments: ["asHtml": true], type: .scalar(String.self)),
      GraphQLField("user", type: .object(User.selections)),
      GraphQLField("likes", type: .list(.object(Like.selections))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: Int, isLiked: Bool? = nil, createdAt: Int, likeCount: Int, text: String? = nil, user: User? = nil, likes: [Like?]? = nil) {
    self.init(unsafeResultMap: ["__typename": "ActivityReply", "id": id, "isLiked": isLiked, "createdAt": createdAt, "likeCount": likeCount, "text": text, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "likes": likes.flatMap { (value: [Like?]) -> [ResultMap?] in value.map { (value: Like?) -> ResultMap? in value.flatMap { (value: Like) -> ResultMap in value.resultMap } } }])
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

  /// The amount of likes the reply has
  public var likeCount: Int {
    get {
      return resultMap["likeCount"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "likeCount")
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
}
