// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class LikeMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Like($id: Int!, $type: LikeableType!) {
      ToggleLikeV2(id: $id, type: $type) {
        __typename
        ... on ListActivity {
          isLiked
          likeCount
        }
        ... on TextActivity {
          isLiked
          likeCount
        }
        ... on MessageActivity {
          isLiked
          likeCount
        }
        ... on ActivityReply {
          isLiked
          likeCount
        }
        ... on Thread {
          isLiked
          likeCount
        }
        ... on ThreadComment {
          isLiked
          likeCount
        }
      }
    }
    """

  public let operationName: String = "Like"

  public var id: Int
  public var type: LikeableType

  public init(id: Int, type: LikeableType) {
    self.id = id
    self.type = type
  }

  public var variables: GraphQLMap? {
    return ["id": id, "type": type]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("ToggleLikeV2", arguments: ["id": GraphQLVariable("id"), "type": GraphQLVariable("type")], type: .object(ToggleLikeV2.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(toggleLikeV2: ToggleLikeV2? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "ToggleLikeV2": toggleLikeV2.flatMap { (value: ToggleLikeV2) -> ResultMap in value.resultMap }])
    }

    /// Add or remove a like from a likeable type.
    public var toggleLikeV2: ToggleLikeV2? {
      get {
        return (resultMap["ToggleLikeV2"] as? ResultMap).flatMap { ToggleLikeV2(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "ToggleLikeV2")
      }
    }

    public struct ToggleLikeV2: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ListActivity", "TextActivity", "MessageActivity", "ActivityReply", "Thread", "ThreadComment"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLTypeCase(
            variants: ["ListActivity": AsListActivity.selections, "TextActivity": AsTextActivity.selections, "MessageActivity": AsMessageActivity.selections, "ActivityReply": AsActivityReply.selections, "Thread": AsThread.selections, "ThreadComment": AsThreadComment.selections],
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

      public static func makeListActivity(isLiked: Bool? = nil, likeCount: Int) -> ToggleLikeV2 {
        return ToggleLikeV2(unsafeResultMap: ["__typename": "ListActivity", "isLiked": isLiked, "likeCount": likeCount])
      }

      public static func makeTextActivity(isLiked: Bool? = nil, likeCount: Int) -> ToggleLikeV2 {
        return ToggleLikeV2(unsafeResultMap: ["__typename": "TextActivity", "isLiked": isLiked, "likeCount": likeCount])
      }

      public static func makeMessageActivity(isLiked: Bool? = nil, likeCount: Int) -> ToggleLikeV2 {
        return ToggleLikeV2(unsafeResultMap: ["__typename": "MessageActivity", "isLiked": isLiked, "likeCount": likeCount])
      }

      public static func makeActivityReply(isLiked: Bool? = nil, likeCount: Int) -> ToggleLikeV2 {
        return ToggleLikeV2(unsafeResultMap: ["__typename": "ActivityReply", "isLiked": isLiked, "likeCount": likeCount])
      }

      public static func makeThread(isLiked: Bool? = nil, likeCount: Int) -> ToggleLikeV2 {
        return ToggleLikeV2(unsafeResultMap: ["__typename": "Thread", "isLiked": isLiked, "likeCount": likeCount])
      }

      public static func makeThreadComment(isLiked: Bool? = nil, likeCount: Int) -> ToggleLikeV2 {
        return ToggleLikeV2(unsafeResultMap: ["__typename": "ThreadComment", "isLiked": isLiked, "likeCount": likeCount])
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
            GraphQLField("likeCount", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(isLiked: Bool? = nil, likeCount: Int) {
          self.init(unsafeResultMap: ["__typename": "ListActivity", "isLiked": isLiked, "likeCount": likeCount])
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

        /// The amount of likes the activity has
        public var likeCount: Int {
          get {
            return resultMap["likeCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "likeCount")
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
            GraphQLField("isLiked", type: .scalar(Bool.self)),
            GraphQLField("likeCount", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(isLiked: Bool? = nil, likeCount: Int) {
          self.init(unsafeResultMap: ["__typename": "TextActivity", "isLiked": isLiked, "likeCount": likeCount])
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

        /// The amount of likes the activity has
        public var likeCount: Int {
          get {
            return resultMap["likeCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "likeCount")
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
            GraphQLField("isLiked", type: .scalar(Bool.self)),
            GraphQLField("likeCount", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(isLiked: Bool? = nil, likeCount: Int) {
          self.init(unsafeResultMap: ["__typename": "MessageActivity", "isLiked": isLiked, "likeCount": likeCount])
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

        /// The amount of likes the activity has
        public var likeCount: Int {
          get {
            return resultMap["likeCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "likeCount")
          }
        }
      }

      public var asActivityReply: AsActivityReply? {
        get {
          if !AsActivityReply.possibleTypes.contains(__typename) { return nil }
          return AsActivityReply(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsActivityReply: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ActivityReply"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("isLiked", type: .scalar(Bool.self)),
            GraphQLField("likeCount", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(isLiked: Bool? = nil, likeCount: Int) {
          self.init(unsafeResultMap: ["__typename": "ActivityReply", "isLiked": isLiked, "likeCount": likeCount])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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
      }

      public var asThread: AsThread? {
        get {
          if !AsThread.possibleTypes.contains(__typename) { return nil }
          return AsThread(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsThread: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Thread"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("isLiked", type: .scalar(Bool.self)),
            GraphQLField("likeCount", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(isLiked: Bool? = nil, likeCount: Int) {
          self.init(unsafeResultMap: ["__typename": "Thread", "isLiked": isLiked, "likeCount": likeCount])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// If the currently authenticated user liked the thread
        public var isLiked: Bool? {
          get {
            return resultMap["isLiked"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isLiked")
          }
        }

        /// The amount of likes the thread has
        public var likeCount: Int {
          get {
            return resultMap["likeCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "likeCount")
          }
        }
      }

      public var asThreadComment: AsThreadComment? {
        get {
          if !AsThreadComment.possibleTypes.contains(__typename) { return nil }
          return AsThreadComment(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsThreadComment: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ThreadComment"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("isLiked", type: .scalar(Bool.self)),
            GraphQLField("likeCount", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(isLiked: Bool? = nil, likeCount: Int) {
          self.init(unsafeResultMap: ["__typename": "ThreadComment", "isLiked": isLiked, "likeCount": likeCount])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// If the currently authenticated user liked the comment
        public var isLiked: Bool? {
          get {
            return resultMap["isLiked"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isLiked")
          }
        }

        /// The amount of likes the comment has
        public var likeCount: Int {
          get {
            return resultMap["likeCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "likeCount")
          }
        }
      }
    }
  }
}
