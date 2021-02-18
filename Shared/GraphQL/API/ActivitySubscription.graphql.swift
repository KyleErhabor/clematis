// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ActivitySubscriptionMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation ActivitySubscription($id: Int!, $subscribe: Boolean!) {
      ToggleActivitySubscription(activityId: $id, subscribe: $subscribe) {
        __typename
        ... on ListActivity {
          isSubscribed
        }
        ... on TextActivity {
          isSubscribed
        }
        ... on MessageActivity {
          isSubscribed
        }
      }
    }
    """

  public let operationName: String = "ActivitySubscription"

  public var id: Int
  public var subscribe: Bool

  public init(id: Int, subscribe: Bool) {
    self.id = id
    self.subscribe = subscribe
  }

  public var variables: GraphQLMap? {
    return ["id": id, "subscribe": subscribe]
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
            variants: ["ListActivity": AsListActivity.selections, "TextActivity": AsTextActivity.selections, "MessageActivity": AsMessageActivity.selections],
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

      public static func makeListActivity(isSubscribed: Bool? = nil) -> ToggleActivitySubscription {
        return ToggleActivitySubscription(unsafeResultMap: ["__typename": "ListActivity", "isSubscribed": isSubscribed])
      }

      public static func makeTextActivity(isSubscribed: Bool? = nil) -> ToggleActivitySubscription {
        return ToggleActivitySubscription(unsafeResultMap: ["__typename": "TextActivity", "isSubscribed": isSubscribed])
      }

      public static func makeMessageActivity(isSubscribed: Bool? = nil) -> ToggleActivitySubscription {
        return ToggleActivitySubscription(unsafeResultMap: ["__typename": "MessageActivity", "isSubscribed": isSubscribed])
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
            GraphQLField("isSubscribed", type: .scalar(Bool.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(isSubscribed: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "ListActivity", "isSubscribed": isSubscribed])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// If the currently authenticated user is subscribed to the activity
        public var isSubscribed: Bool? {
          get {
            return resultMap["isSubscribed"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isSubscribed")
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
            GraphQLField("isSubscribed", type: .scalar(Bool.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(isSubscribed: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "TextActivity", "isSubscribed": isSubscribed])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// If the currently authenticated user is subscribed to the activity
        public var isSubscribed: Bool? {
          get {
            return resultMap["isSubscribed"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isSubscribed")
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
            GraphQLField("isSubscribed", type: .scalar(Bool.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(isSubscribed: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "MessageActivity", "isSubscribed": isSubscribed])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// If the currently authenticated user is subscribed to the activity
        public var isSubscribed: Bool? {
          get {
            return resultMap["isSubscribed"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isSubscribed")
          }
        }
      }
    }
  }
}
