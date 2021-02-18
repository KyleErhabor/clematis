// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ThreadQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Thread($id: Int!, $page: Int!) {
      Thread(id: $id) {
        __typename
        id
        title
        isLiked
        isLocked
        isSticky
        createdAt
        likeCount
        viewCount
        replyCount
        isSubscribed
        body(asHtml: true)
        likes {
          __typename
          ...userPreviewFragment
        }
        user {
          __typename
          ...userPreviewFragment
        }
      }
      Page(page: $page) {
        __typename
        pageInfo {
          __typename
          hasNextPage
        }
        threadComments(threadId: $id) {
          __typename
          id
          isLiked
          createdAt
          likeCount
          comment(asHtml: true)
          user {
            __typename
            ...userPreviewFragment
          }
          likes {
            __typename
            ...userPreviewFragment
          }
          childComments
        }
      }
    }
    """

  public let operationName: String = "Thread"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + UserPreviewFragment.fragmentDefinition)
    return document
  }

  public var id: Int
  public var page: Int

  public init(id: Int, page: Int) {
    self.id = id
    self.page = page
  }

  public var variables: GraphQLMap? {
    return ["id": id, "page": page]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Thread", arguments: ["id": GraphQLVariable("id")], type: .object(Thread.selections)),
        GraphQLField("Page", arguments: ["page": GraphQLVariable("page")], type: .object(Page.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(thread: Thread? = nil, page: Page? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Thread": thread.flatMap { (value: Thread) -> ResultMap in value.resultMap }, "Page": page.flatMap { (value: Page) -> ResultMap in value.resultMap }])
    }

    /// Thread query
    public var thread: Thread? {
      get {
        return (resultMap["Thread"] as? ResultMap).flatMap { Thread(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Thread")
      }
    }

    public var page: Page? {
      get {
        return (resultMap["Page"] as? ResultMap).flatMap { Page(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Page")
      }
    }

    public struct Thread: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Thread"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("isLiked", type: .scalar(Bool.self)),
          GraphQLField("isLocked", type: .scalar(Bool.self)),
          GraphQLField("isSticky", type: .scalar(Bool.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(Int.self))),
          GraphQLField("likeCount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("viewCount", type: .scalar(Int.self)),
          GraphQLField("replyCount", type: .scalar(Int.self)),
          GraphQLField("isSubscribed", type: .scalar(Bool.self)),
          GraphQLField("body", arguments: ["asHtml": true], type: .scalar(String.self)),
          GraphQLField("likes", type: .list(.object(Like.selections))),
          GraphQLField("user", type: .object(User.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, title: String? = nil, isLiked: Bool? = nil, isLocked: Bool? = nil, isSticky: Bool? = nil, createdAt: Int, likeCount: Int, viewCount: Int? = nil, replyCount: Int? = nil, isSubscribed: Bool? = nil, body: String? = nil, likes: [Like?]? = nil, user: User? = nil) {
        self.init(unsafeResultMap: ["__typename": "Thread", "id": id, "title": title, "isLiked": isLiked, "isLocked": isLocked, "isSticky": isSticky, "createdAt": createdAt, "likeCount": likeCount, "viewCount": viewCount, "replyCount": replyCount, "isSubscribed": isSubscribed, "body": body, "likes": likes.flatMap { (value: [Like?]) -> [ResultMap?] in value.map { (value: Like?) -> ResultMap? in value.flatMap { (value: Like) -> ResultMap in value.resultMap } } }, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the thread
      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The title of the thread
      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// If the currently authenticated user liked the thread
      public var isLiked: Bool? {
        get {
          return resultMap["isLiked"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isLiked")
        }
      }

      /// If the thread is locked and can receive comments
      public var isLocked: Bool? {
        get {
          return resultMap["isLocked"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isLocked")
        }
      }

      /// If the thread is stickied and should be displayed at the top of the page
      public var isSticky: Bool? {
        get {
          return resultMap["isSticky"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isSticky")
        }
      }

      /// The time of the thread creation
      public var createdAt: Int {
        get {
          return resultMap["createdAt"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      /// The amount of likes the thread has
      public var likeCount: Int {
        get {
          return resultMap["likeCount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "likeCount")
        }
      }

      /// The number of times users have viewed the thread
      public var viewCount: Int? {
        get {
          return resultMap["viewCount"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "viewCount")
        }
      }

      /// The number of comments on the thread
      public var replyCount: Int? {
        get {
          return resultMap["replyCount"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "replyCount")
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

      /// The text body of the thread (Markdown)
      public var body: String? {
        get {
          return resultMap["body"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "body")
        }
      }

      /// The users who liked the thread
      public var likes: [Like?]? {
        get {
          return (resultMap["likes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Like?] in value.map { (value: ResultMap?) -> Like? in value.flatMap { (value: ResultMap) -> Like in Like(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Like?]) -> [ResultMap?] in value.map { (value: Like?) -> ResultMap? in value.flatMap { (value: Like) -> ResultMap in value.resultMap } } }, forKey: "likes")
        }
      }

      /// The owner of the thread
      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public struct Like: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(UserPreviewFragment.self),
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

          public var userPreviewFragment: UserPreviewFragment {
            get {
              return UserPreviewFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(UserPreviewFragment.self),
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

          public var userPreviewFragment: UserPreviewFragment {
            get {
              return UserPreviewFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }

    public struct Page: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Page"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pageInfo", type: .object(PageInfo.selections)),
          GraphQLField("threadComments", arguments: ["threadId": GraphQLVariable("id")], type: .list(.object(ThreadComment.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pageInfo: PageInfo? = nil, threadComments: [ThreadComment?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Page", "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }, "threadComments": threadComments.flatMap { (value: [ThreadComment?]) -> [ResultMap?] in value.map { (value: ThreadComment?) -> ResultMap? in value.flatMap { (value: ThreadComment) -> ResultMap in value.resultMap } } }])
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

      public var threadComments: [ThreadComment?]? {
        get {
          return (resultMap["threadComments"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ThreadComment?] in value.map { (value: ResultMap?) -> ThreadComment? in value.flatMap { (value: ResultMap) -> ThreadComment in ThreadComment(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ThreadComment?]) -> [ResultMap?] in value.map { (value: ThreadComment?) -> ResultMap? in value.flatMap { (value: ThreadComment) -> ResultMap in value.resultMap } } }, forKey: "threadComments")
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

      public struct ThreadComment: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ThreadComment"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("isLiked", type: .scalar(Bool.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(Int.self))),
            GraphQLField("likeCount", type: .nonNull(.scalar(Int.self))),
            GraphQLField("comment", arguments: ["asHtml": true], type: .scalar(String.self)),
            GraphQLField("user", type: .object(User.selections)),
            GraphQLField("likes", type: .list(.object(Like.selections))),
            GraphQLField("childComments", type: .scalar(Json.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, isLiked: Bool? = nil, createdAt: Int, likeCount: Int, comment: String? = nil, user: User? = nil, likes: [Like?]? = nil, childComments: Json? = nil) {
          self.init(unsafeResultMap: ["__typename": "ThreadComment", "id": id, "isLiked": isLiked, "createdAt": createdAt, "likeCount": likeCount, "comment": comment, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "likes": likes.flatMap { (value: [Like?]) -> [ResultMap?] in value.map { (value: Like?) -> ResultMap? in value.flatMap { (value: Like) -> ResultMap in value.resultMap } } }, "childComments": childComments])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the comment
        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// If the currently authenticated user liked the comment
        public var isLiked: Bool? {
          get {
            return resultMap["isLiked"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isLiked")
          }
        }

        /// The time of the comments creation
        public var createdAt: Int {
          get {
            return resultMap["createdAt"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        /// The amount of likes the comment has
        public var likeCount: Int {
          get {
            return resultMap["likeCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "likeCount")
          }
        }

        /// The text content of the comment (Markdown)
        public var comment: String? {
          get {
            return resultMap["comment"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "comment")
          }
        }

        /// The user who created the comment
        public var user: User? {
          get {
            return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "user")
          }
        }

        /// The users who liked the comment
        public var likes: [Like?]? {
          get {
            return (resultMap["likes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Like?] in value.map { (value: ResultMap?) -> Like? in value.flatMap { (value: ResultMap) -> Like in Like(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Like?]) -> [ResultMap?] in value.map { (value: Like?) -> ResultMap? in value.flatMap { (value: Like) -> ResultMap in value.resultMap } } }, forKey: "likes")
          }
        }

        /// The comment's child reply comments
        public var childComments: Json? {
          get {
            return resultMap["childComments"] as? Json
          }
          set {
            resultMap.updateValue(newValue, forKey: "childComments")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["User"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(UserPreviewFragment.self),
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

            public var userPreviewFragment: UserPreviewFragment {
              get {
                return UserPreviewFragment(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }

        public struct Like: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["User"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(UserPreviewFragment.self),
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

            public var userPreviewFragment: UserPreviewFragment {
              get {
                return UserPreviewFragment(unsafeResultMap: resultMap)
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
