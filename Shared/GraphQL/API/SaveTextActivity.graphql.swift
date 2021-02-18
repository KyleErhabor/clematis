// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class SaveTextActivityMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SaveTextActivity($id: Int, $text: String!) {
      SaveTextActivity(id: $id, text: $text) {
        __typename
        ...textActivityFragment
      }
    }
    """

  public let operationName: String = "SaveTextActivity"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + TextActivityFragment.fragmentDefinition)
    document.append("\n" + UserPreviewFragment.fragmentDefinition)
    return document
  }

  public var id: Int?
  public var text: String

  public init(id: Int? = nil, text: String) {
    self.id = id
    self.text = text
  }

  public var variables: GraphQLMap? {
    return ["id": id, "text": text]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("SaveTextActivity", arguments: ["id": GraphQLVariable("id"), "text": GraphQLVariable("text")], type: .object(SaveTextActivity.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(saveTextActivity: SaveTextActivity? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "SaveTextActivity": saveTextActivity.flatMap { (value: SaveTextActivity) -> ResultMap in value.resultMap }])
    }

    /// Create or update text activity for the currently authenticated user
    public var saveTextActivity: SaveTextActivity? {
      get {
        return (resultMap["SaveTextActivity"] as? ResultMap).flatMap { SaveTextActivity(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "SaveTextActivity")
      }
    }

    public struct SaveTextActivity: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TextActivity"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(TextActivityFragment.self),
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

        public var textActivityFragment: TextActivityFragment {
          get {
            return TextActivityFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}
