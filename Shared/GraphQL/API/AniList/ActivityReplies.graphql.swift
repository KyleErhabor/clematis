// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ActivityRepliesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ActivityReplies($page: Int!, $perPage: Int!, $activityID: Int!) {
      Page(page: $page, perPage: $perPage) {
        __typename
        activityReplies(activityId: $activityID) {
          __typename
          id
          isLiked
          likeCount
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
      }
    }
    """

  public let operationName: String = "ActivityReplies"

  public var page: Int
  public var perPage: Int
  public var activityID: Int

  public init(page: Int, perPage: Int, activityID: Int) {
    self.page = page
    self.perPage = perPage
    self.activityID = activityID
  }

  public var variables: GraphQLMap? {
    return ["page": page, "perPage": perPage, "activityID": activityID]
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
          GraphQLField("activityReplies", arguments: ["activityId": GraphQLVariable("activityID")], type: .list(.object(ActivityReply.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(activityReplies: [ActivityReply?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Page", "activityReplies": activityReplies.flatMap { (value: [ActivityReply?]) -> [ResultMap?] in value.map { (value: ActivityReply?) -> ResultMap? in value.flatMap { (value: ActivityReply) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var activityReplies: [ActivityReply?]? {
        get {
          return (resultMap["activityReplies"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ActivityReply?] in value.map { (value: ResultMap?) -> ActivityReply? in value.flatMap { (value: ResultMap) -> ActivityReply in ActivityReply(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ActivityReply?]) -> [ResultMap?] in value.map { (value: ActivityReply?) -> ResultMap? in value.flatMap { (value: ActivityReply) -> ResultMap in value.resultMap } } }, forKey: "activityReplies")
        }
      }

      public struct ActivityReply: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ActivityReply"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("isLiked", type: .scalar(Bool.self)),
            GraphQLField("likeCount", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAt", type: .nonNull(.scalar(Int.self))),
            GraphQLField("text", arguments: ["asHtml": true], type: .scalar(String.self)),
            GraphQLField("user", type: .object(User.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, isLiked: Bool? = nil, likeCount: Int, createdAt: Int, text: String? = nil, user: User? = nil) {
          self.init(unsafeResultMap: ["__typename": "ActivityReply", "id": id, "isLiked": isLiked, "likeCount": likeCount, "createdAt": createdAt, "text": text, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
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

        /// The amount of likes the reply has
        public var likeCount: Int {
          get {
            return resultMap["likeCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "likeCount")
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
    }
  }
}
