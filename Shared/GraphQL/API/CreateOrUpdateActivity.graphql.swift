// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class CreateOrUpdateActivityMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateOrUpdateActivity($id: Int, $activityId: Int, $text: String!) {
      SaveActivityReply(id: $id, activityId: $activityId, text: $text) {
        __typename
        ...activityReplyFragment
      }
    }
    """

  public let operationName: String = "CreateOrUpdateActivity"

  public var queryDocument: String { return operationDefinition.appending("\n" + ActivityReplyFragment.fragmentDefinition) }

  public var id: Int?
  public var activityId: Int?
  public var text: String

  public init(id: Int? = nil, activityId: Int? = nil, text: String) {
    self.id = id
    self.activityId = activityId
    self.text = text
  }

  public var variables: GraphQLMap? {
    return ["id": id, "activityId": activityId, "text": text]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("SaveActivityReply", arguments: ["id": GraphQLVariable("id"), "activityId": GraphQLVariable("activityId"), "text": GraphQLVariable("text")], type: .object(SaveActivityReply.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(saveActivityReply: SaveActivityReply? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "SaveActivityReply": saveActivityReply.flatMap { (value: SaveActivityReply) -> ResultMap in value.resultMap }])
    }

    /// Create or update an activity reply
    public var saveActivityReply: SaveActivityReply? {
      get {
        return (resultMap["SaveActivityReply"] as? ResultMap).flatMap { SaveActivityReply(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "SaveActivityReply")
      }
    }

    public struct SaveActivityReply: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ActivityReply"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ActivityReplyFragment.self),
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

        public var activityReplyFragment: ActivityReplyFragment {
          get {
            return ActivityReplyFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}
