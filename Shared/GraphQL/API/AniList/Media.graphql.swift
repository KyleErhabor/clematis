// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class MediaQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Media($page: Int!, $id: Int, $search: String) {
      Page(page: $page, perPage: 50) {
        __typename
        media(id: $id, search: $search) {
          __typename
          id
        }
      }
    }
    """

  public let operationName: String = "Media"

  public var page: Int
  public var id: Int?
  public var search: String?

  public init(page: Int, id: Int? = nil, search: String? = nil) {
    self.page = page
    self.id = id
    self.search = search
  }

  public var variables: GraphQLMap? {
    return ["page": page, "id": id, "search": search]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Page", arguments: ["page": GraphQLVariable("page"), "perPage": 50], type: .object(Page.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(page: Page? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Page": page.flatMap { (value: Page) -> ResultMap in value.resultMap }])
    }

    public var page: Page? {
      get {
        return (resultMap["Page"] as? ResultMap).flatMap { Page(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Page")
      }
    }

    public struct Page: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Page"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("media", arguments: ["id": GraphQLVariable("id"), "search": GraphQLVariable("search")], type: .list(.object(Medium.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(media: [Medium?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Page", "media": media.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var media: [Medium?]? {
        get {
          return (resultMap["media"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Medium?] in value.map { (value: ResultMap?) -> Medium? in value.flatMap { (value: ResultMap) -> Medium in Medium(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }, forKey: "media")
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

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
          self.init(unsafeResultMap: ["__typename": "Media", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the media
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
