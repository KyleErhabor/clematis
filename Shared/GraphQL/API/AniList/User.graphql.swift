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
        isFollower
        bannerImage
        isFollowing
        about(asHtml: true)
        avatar {
          __typename
          large
        }
        options {
          __typename
          profileColor
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
          GraphQLField("isFollower", type: .scalar(Bool.self)),
          GraphQLField("bannerImage", type: .scalar(String.self)),
          GraphQLField("isFollowing", type: .scalar(Bool.self)),
          GraphQLField("about", arguments: ["asHtml": true], type: .scalar(String.self)),
          GraphQLField("avatar", type: .object(Avatar.selections)),
          GraphQLField("options", type: .object(Option.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, isBlocked: Bool? = nil, isFollower: Bool? = nil, bannerImage: String? = nil, isFollowing: Bool? = nil, about: String? = nil, avatar: Avatar? = nil, options: Option? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "name": name, "isBlocked": isBlocked, "isFollower": isFollower, "bannerImage": bannerImage, "isFollowing": isFollowing, "about": about, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }, "options": options.flatMap { (value: Option) -> ResultMap in value.resultMap }])
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

      /// If the authenticated user if following this user
      public var isFollowing: Bool? {
        get {
          return resultMap["isFollowing"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isFollowing")
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
    }
  }
}
