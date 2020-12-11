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
          ...listActivityFragment
        }
      }
    }
    """

  public let operationName: String = "Like"

  public var queryDocument: String { return operationDefinition.appending("\n" + ListActivityFragment.fragmentDefinition) }

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
            variants: ["ListActivity": AsListActivity.selections],
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

      public static func makeTextActivity() -> ToggleLikeV2 {
        return ToggleLikeV2(unsafeResultMap: ["__typename": "TextActivity"])
      }

      public static func makeMessageActivity() -> ToggleLikeV2 {
        return ToggleLikeV2(unsafeResultMap: ["__typename": "MessageActivity"])
      }

      public static func makeActivityReply() -> ToggleLikeV2 {
        return ToggleLikeV2(unsafeResultMap: ["__typename": "ActivityReply"])
      }

      public static func makeThread() -> ToggleLikeV2 {
        return ToggleLikeV2(unsafeResultMap: ["__typename": "Thread"])
      }

      public static func makeThreadComment() -> ToggleLikeV2 {
        return ToggleLikeV2(unsafeResultMap: ["__typename": "ThreadComment"])
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
            GraphQLFragmentSpread(ListActivityFragment.self),
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

          public var listActivityFragment: ListActivityFragment {
            get {
              return ListActivityFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}
