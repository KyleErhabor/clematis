// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class DeleteMediaListEntryMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeleteMediaListEntry($id: Int!) {
      DeleteMediaListEntry(id: $id) {
        __typename
        deleted
      }
    }
    """

  public let operationName: String = "DeleteMediaListEntry"

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
        GraphQLField("DeleteMediaListEntry", arguments: ["id": GraphQLVariable("id")], type: .object(DeleteMediaListEntry.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteMediaListEntry: DeleteMediaListEntry? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "DeleteMediaListEntry": deleteMediaListEntry.flatMap { (value: DeleteMediaListEntry) -> ResultMap in value.resultMap }])
    }

    /// Delete a media list entry
    public var deleteMediaListEntry: DeleteMediaListEntry? {
      get {
        return (resultMap["DeleteMediaListEntry"] as? ResultMap).flatMap { DeleteMediaListEntry(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "DeleteMediaListEntry")
      }
    }

    public struct DeleteMediaListEntry: GraphQLSelectionSet {
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
