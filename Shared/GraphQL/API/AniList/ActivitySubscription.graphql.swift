// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ActivitySubscriptionMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation ActivitySubscription($id: Int!, $subscribe: Boolean!, $includeBuggyFields: Boolean!) {
      ToggleActivitySubscription(activityId: $id, subscribe: $subscribe) {
        __typename
        ... on TextActivity {
          id
        }
        ... on ListActivity {
          ...listActivityFragment
        }
        ... on MessageActivity {
          id
        }
      }
    }
    """

  public let operationName: String = "ActivitySubscription"

  public var queryDocument: String { return operationDefinition.appending("\n" + ListActivityFragment.fragmentDefinition) }

  public var id: Int
  public var subscribe: Bool
  public var includeBuggyFields: Bool

  public init(id: Int, subscribe: Bool, includeBuggyFields: Bool) {
    self.id = id
    self.subscribe = subscribe
    self.includeBuggyFields = includeBuggyFields
  }

  public var variables: GraphQLMap? {
    return ["id": id, "subscribe": subscribe, "includeBuggyFields": includeBuggyFields]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("ToggleActivitySubscription", arguments: ["activityId": GraphQLVariable("id"), "subscribe": GraphQLVariable("subscribe")], type: .object(ToggleActivitySubscription.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(toggleActivitySubscription: ToggleActivitySubscription? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "ToggleActivitySubscription": toggleActivitySubscription.flatMap { (value: ToggleActivitySubscription) -> ResultMap in value.resultMap }])
    }

    /// Toggle the subscription of an activity item
    public var toggleActivitySubscription: ToggleActivitySubscription? {
      get {
        return (resultMap["ToggleActivitySubscription"] as? ResultMap).flatMap { ToggleActivitySubscription(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "ToggleActivitySubscription")
      }
    }

    public struct ToggleActivitySubscription: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TextActivity", "ListActivity", "MessageActivity"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLTypeCase(
            variants: ["TextActivity": AsTextActivity.selections, "ListActivity": AsListActivity.selections, "MessageActivity": AsMessageActivity.selections],
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

      public static func makeTextActivity(id: Int) -> ToggleActivitySubscription {
        return ToggleActivitySubscription(unsafeResultMap: ["__typename": "TextActivity", "id": id])
      }

      public static func makeMessageActivity(id: Int) -> ToggleActivitySubscription {
        return ToggleActivitySubscription(unsafeResultMap: ["__typename": "MessageActivity", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int) {
          self.init(unsafeResultMap: ["__typename": "TextActivity", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the activity
        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
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
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int) {
          self.init(unsafeResultMap: ["__typename": "MessageActivity", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the activity
        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}
