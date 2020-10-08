// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class UserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query User($id: Int!) {
      User(id: $id) {
        __typename
        name
        isBlocked
        isFollower
        bannerImage
        isFollowing
        about(asHtml: true)
        avatar {
          __typename
          large
        }
        options {
          __typename
          profileColor
        }
        statistics {
          __typename
          anime {
            __typename
            ...userStatisticsFragment
          }
          manga {
            __typename
            ...userStatisticsFragment
          }
        }
      }
    }
    """

  public let operationName: String = "User"

  public var queryDocument: String { return operationDefinition.appending("\n" + UserStatisticsFragment.fragmentDefinition) }

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("User", arguments: ["id": GraphQLVariable("id")], type: .object(User.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "User": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
    }

    /// User query
    public var user: User? {
      get {
        return (resultMap["User"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "User")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("isBlocked", type: .scalar(Bool.self)),
          GraphQLField("isFollower", type: .scalar(Bool.self)),
          GraphQLField("bannerImage", type: .scalar(String.self)),
          GraphQLField("isFollowing", type: .scalar(Bool.self)),
          GraphQLField("about", arguments: ["asHtml": true], type: .scalar(String.self)),
          GraphQLField("avatar", type: .object(Avatar.selections)),
          GraphQLField("options", type: .object(Option.selections)),
          GraphQLField("statistics", type: .object(Statistic.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, isBlocked: Bool? = nil, isFollower: Bool? = nil, bannerImage: String? = nil, isFollowing: Bool? = nil, about: String? = nil, avatar: Avatar? = nil, options: Option? = nil, statistics: Statistic? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "name": name, "isBlocked": isBlocked, "isFollower": isFollower, "bannerImage": bannerImage, "isFollowing": isFollowing, "about": about, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }, "options": options.flatMap { (value: Option) -> ResultMap in value.resultMap }, "statistics": statistics.flatMap { (value: Statistic) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The name of the user
      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// If the user is blocked by the authenticated user
      public var isBlocked: Bool? {
        get {
          return resultMap["isBlocked"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isBlocked")
        }
      }

      /// If this user if following the authenticated user
      public var isFollower: Bool? {
        get {
          return resultMap["isFollower"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isFollower")
        }
      }

      /// The user's banner images
      public var bannerImage: String? {
        get {
          return resultMap["bannerImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "bannerImage")
        }
      }

      /// If the authenticated user if following this user
      public var isFollowing: Bool? {
        get {
          return resultMap["isFollowing"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isFollowing")
        }
      }

      /// The bio written by user (Markdown)
      public var about: String? {
        get {
          return resultMap["about"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "about")
        }
      }

      /// The user's avatar images
      public var avatar: Avatar? {
        get {
          return (resultMap["avatar"] as? ResultMap).flatMap { Avatar(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "avatar")
        }
      }

      /// The user's general options
      public var options: Option? {
        get {
          return (resultMap["options"] as? ResultMap).flatMap { Option(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "options")
        }
      }

      /// The users anime & manga list statistics
      public var statistics: Statistic? {
        get {
          return (resultMap["statistics"] as? ResultMap).flatMap { Statistic(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "statistics")
        }
      }

      public struct Avatar: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["UserAvatar"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("large", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(large: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "UserAvatar", "large": large])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The avatar of user at its largest size
        public var large: String? {
          get {
            return resultMap["large"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "large")
          }
        }
      }

      public struct Option: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["UserOptions"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("profileColor", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(profileColor: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "UserOptions", "profileColor": profileColor])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Profile highlight color (blue, purple, pink, orange, red, green, gray)
        public var profileColor: String? {
          get {
            return resultMap["profileColor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profileColor")
          }
        }
      }

      public struct Statistic: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["UserStatisticTypes"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("anime", type: .object(Anime.selections)),
            GraphQLField("manga", type: .object(Manga.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(anime: Anime? = nil, manga: Manga? = nil) {
          self.init(unsafeResultMap: ["__typename": "UserStatisticTypes", "anime": anime.flatMap { (value: Anime) -> ResultMap in value.resultMap }, "manga": manga.flatMap { (value: Manga) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var anime: Anime? {
          get {
            return (resultMap["anime"] as? ResultMap).flatMap { Anime(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "anime")
          }
        }

        public var manga: Manga? {
          get {
            return (resultMap["manga"] as? ResultMap).flatMap { Manga(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "manga")
          }
        }

        public struct Anime: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["UserStatistics"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(UserStatisticsFragment.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(count: Int, meanScore: Double, volumesRead: Int, chaptersRead: Int, minutesWatched: Int, episodesWatched: Int) {
            self.init(unsafeResultMap: ["__typename": "UserStatistics", "count": count, "meanScore": meanScore, "volumesRead": volumesRead, "chaptersRead": chaptersRead, "minutesWatched": minutesWatched, "episodesWatched": episodesWatched])
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

            public var userStatisticsFragment: UserStatisticsFragment {
              get {
                return UserStatisticsFragment(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }

        public struct Manga: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["UserStatistics"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(UserStatisticsFragment.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(count: Int, meanScore: Double, volumesRead: Int, chaptersRead: Int, minutesWatched: Int, episodesWatched: Int) {
            self.init(unsafeResultMap: ["__typename": "UserStatistics", "count": count, "meanScore": meanScore, "volumesRead": volumesRead, "chaptersRead": chaptersRead, "minutesWatched": minutesWatched, "episodesWatched": episodesWatched])
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

            public var userStatisticsFragment: UserStatisticsFragment {
              get {
                return UserStatisticsFragment(unsafeResultMap: resultMap)
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

public struct UserStatisticsFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment userStatisticsFragment on UserStatistics {
      __typename
      count
      meanScore
      volumesRead
      chaptersRead
      minutesWatched
      episodesWatched
    }
    """

  public static let possibleTypes: [String] = ["UserStatistics"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("count", type: .nonNull(.scalar(Int.self))),
      GraphQLField("meanScore", type: .nonNull(.scalar(Double.self))),
      GraphQLField("volumesRead", type: .nonNull(.scalar(Int.self))),
      GraphQLField("chaptersRead", type: .nonNull(.scalar(Int.self))),
      GraphQLField("minutesWatched", type: .nonNull(.scalar(Int.self))),
      GraphQLField("episodesWatched", type: .nonNull(.scalar(Int.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(count: Int, meanScore: Double, volumesRead: Int, chaptersRead: Int, minutesWatched: Int, episodesWatched: Int) {
    self.init(unsafeResultMap: ["__typename": "UserStatistics", "count": count, "meanScore": meanScore, "volumesRead": volumesRead, "chaptersRead": chaptersRead, "minutesWatched": minutesWatched, "episodesWatched": episodesWatched])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var count: Int {
    get {
      return resultMap["count"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "count")
    }
  }

  public var meanScore: Double {
    get {
      return resultMap["meanScore"]! as! Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "meanScore")
    }
  }

  public var volumesRead: Int {
    get {
      return resultMap["volumesRead"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "volumesRead")
    }
  }

  public var chaptersRead: Int {
    get {
      return resultMap["chaptersRead"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "chaptersRead")
    }
  }

  public var minutesWatched: Int {
    get {
      return resultMap["minutesWatched"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "minutesWatched")
    }
  }

  public var episodesWatched: Int {
    get {
      return resultMap["episodesWatched"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "episodesWatched")
    }
  }
}
