// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ThreadSubscriptionMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation ThreadSubscription($id: Int!, $subscribe: Boolean!) {
      ToggleThreadSubscription(threadId: $id, subscribe: $subscribe) {
        __typename
        isSubscribed
      }
    }
    """

  public let operationName: String = "ThreadSubscription"

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
        GraphQLField("ToggleThreadSubscription", arguments: ["threadId": GraphQLVariable("id"), "subscribe": GraphQLVariable("subscribe")], type: .object(ToggleThreadSubscription.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(toggleThreadSubscription: ToggleThreadSubscription? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "ToggleThreadSubscription": toggleThreadSubscription.flatMap { (value: ToggleThreadSubscription) -> ResultMap in value.resultMap }])
    }

    /// Toggle the subscription of a forum thread
    public var toggleThreadSubscription: ToggleThreadSubscription? {
      get {
        return (resultMap["ToggleThreadSubscription"] as? ResultMap).flatMap { ToggleThreadSubscription(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "ToggleThreadSubscription")
      }
    }

    public struct ToggleThreadSubscription: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Thread"]

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
        self.init(unsafeResultMap: ["__typename": "Thread", "isSubscribed": isSubscribed])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// If the currently authenticated user is subscribed to the thread
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
