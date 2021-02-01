// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ActivityFeedQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ActivityFeed($page: Int, $isFollowing: Boolean!, $hasRepliesOrTypeText: Boolean!) {
      Page(page: $page) {
        __typename
        pageInfo {
          __typename
          hasNextPage
        }
        activities(
          isFollowing: $isFollowing
          hasRepliesOrTypeText: $hasRepliesOrTypeText
          type_in: [TEXT, ANIME_LIST, MANGA_LIST]
          sort: [ID_DESC]
        ) {
          __typename
          ... on ListActivity {
            ...listActivityFragment
          }
          ... on TextActivity {
            ...textActivityFragment
          }
        }
      }
    }
    """

  public let operationName: String = "ActivityFeed"

  public var queryDocument: String { return operationDefinition.appending("\n" + ListActivityFragment.fragmentDefinition).appending("\n" + TextActivityFragment.fragmentDefinition) }

  public var page: Int?
  public var isFollowing: Bool
  public var hasRepliesOrTypeText: Bool

  public init(page: Int? = nil, isFollowing: Bool, hasRepliesOrTypeText: Bool) {
    self.page = page
    self.isFollowing = isFollowing
    self.hasRepliesOrTypeText = hasRepliesOrTypeText
  }

  public var variables: GraphQLMap? {
    return ["page": page, "isFollowing": isFollowing, "hasRepliesOrTypeText": hasRepliesOrTypeText]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Page", arguments: ["page": GraphQLVariable("page")], type: .object(Page.selections)),
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
          GraphQLField("pageInfo", type: .object(PageInfo.selections)),
          GraphQLField("activities", arguments: ["isFollowing": GraphQLVariable("isFollowing"), "hasRepliesOrTypeText": GraphQLVariable("hasRepliesOrTypeText"), "type_in": ["TEXT", "ANIME_LIST", "MANGA_LIST"], "sort": ["ID_DESC"]], type: .list(.object(Activity.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pageInfo: PageInfo? = nil, activities: [Activity?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Page", "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }, "activities": activities.flatMap { (value: [Activity?]) -> [ResultMap?] in value.map { (value: Activity?) -> ResultMap? in value.flatMap { (value: Activity) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The pagination information
      public var pageInfo: PageInfo? {
        get {
          return (resultMap["pageInfo"] as? ResultMap).flatMap { PageInfo(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "pageInfo")
        }
      }

      public var activities: [Activity?]? {
        get {
          return (resultMap["activities"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Activity?] in value.map { (value: ResultMap?) -> Activity? in value.flatMap { (value: ResultMap) -> Activity in Activity(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Activity?]) -> [ResultMap?] in value.map { (value: Activity?) -> ResultMap? in value.flatMap { (value: Activity) -> ResultMap in value.resultMap } } }, forKey: "activities")
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PageInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("hasNextPage", type: .scalar(Bool.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hasNextPage: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// If there is another page
        public var hasNextPage: Bool? {
          get {
            return resultMap["hasNextPage"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }
      }

      public struct Activity: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["TextActivity", "ListActivity", "MessageActivity"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLTypeCase(
              variants: ["ListActivity": AsListActivity.selections, "TextActivity": AsTextActivity.selections],
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

        public static func makeMessageActivity() -> Activity {
          return Activity(unsafeResultMap: ["__typename": "MessageActivity"])
        }

        public static func makeTextActivity(id: Int) -> Activity {
          return Activity(unsafeResultMap: ["__typename": "TextActivity", "id": id])
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
              GraphQLFragmentSpread(TextActivityFragment.self),
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
  }
}
