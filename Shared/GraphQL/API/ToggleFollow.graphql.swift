// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ToggleFollowMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation ToggleFollow($id: Int!) {
      ToggleFollow(userId: $id) {
        __typename
        isFollowing
      }
    }
    """

  public let operationName: String = "ToggleFollow"

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("ToggleFollow", arguments: ["userId": GraphQLVariable("id")], type: .object(ToggleFollow.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(toggleFollow: ToggleFollow? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "ToggleFollow": toggleFollow.flatMap { (value: ToggleFollow) -> ResultMap in value.resultMap }])
    }

    /// Toggle the un/following of a user
    public var toggleFollow: ToggleFollow? {
      get {
        return (resultMap["ToggleFollow"] as? ResultMap).flatMap { ToggleFollow(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "ToggleFollow")
      }
    }

    public struct ToggleFollow: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("isFollowing", type: .scalar(Bool.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(isFollowing: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "isFollowing": isFollowing])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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
    }
  }
}
