// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class DeleteActivityMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeleteActivity($id: Int!) {
      DeleteActivity(id: $id) {
        __typename
        deleted
      }
    }
    """

  public let operationName: String = "DeleteActivity"

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
        GraphQLField("DeleteActivity", arguments: ["id": GraphQLVariable("id")], type: .object(DeleteActivity.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteActivity: DeleteActivity? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "DeleteActivity": deleteActivity.flatMap { (value: DeleteActivity) -> ResultMap in value.resultMap }])
    }

    /// Delete an activity item of the authenticated users
    public var deleteActivity: DeleteActivity? {
      get {
        return (resultMap["DeleteActivity"] as? ResultMap).flatMap { DeleteActivity(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "DeleteActivity")
      }
    }

    public struct DeleteActivity: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Deleted"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("deleted", type: .scalar(Bool.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(deleted: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "Deleted", "deleted": deleted])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// If an item has been successfully deleted
      public var deleted: Bool? {
        get {
          return resultMap["deleted"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "deleted")
        }
      }
    }
  }
}
