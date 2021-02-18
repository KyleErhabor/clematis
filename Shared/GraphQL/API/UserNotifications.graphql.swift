// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class UserNotificationsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query UserNotifications {
      Page {
        __typename
        notifications(resetNotificationCount: true) {
          __typename
          ... on AiringNotification {
            id
            episode
            createdAt
            media {
              __typename
              id
              title {
                __typename
                userPreferred
              }
              coverImage {
                __typename
                color
                extraLarge
              }
            }
          }
          ... on FollowingNotification {
            id
            createdAt
            user {
              __typename
              id
              name
              avatar {
                __typename
                large
              }
            }
          }
          ... on ActivityMessageNotification {
            id
            createdAt
            user {
              __typename
              id
              name
              avatar {
                __typename
                large
              }
            }
          }
          ... on ActivityMentionNotification {
            id
            createdAt
            user {
              __typename
              id
              name
              avatar {
                __typename
                large
              }
            }
          }
          ... on ActivityReplyNotification {
            id
          }
          ... on ActivityReplySubscribedNotification {
            id
          }
          ... on ActivityLikeNotification {
            id
          }
          ... on ActivityReplyLikeNotification {
            id
          }
          ... on ThreadCommentMentionNotification {
            id
          }
          ... on ThreadCommentReplyNotification {
            id
          }
          ... on ThreadCommentSubscribedNotification {
            id
          }
          ... on ThreadCommentLikeNotification {
            id
          }
          ... on ThreadLikeNotification {
            id
          }
          ... on RelatedMediaAdditionNotification {
            id
          }
        }
      }
    }
    """

  public let operationName: String = "UserNotifications"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Page", type: .object(Page.selections)),
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
          GraphQLField("notifications", arguments: ["resetNotificationCount": true], type: .list(.object(Notification.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(notifications: [Notification?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Page", "notifications": notifications.flatMap { (value: [Notification?]) -> [ResultMap?] in value.map { (value: Notification?) -> ResultMap? in value.flatMap { (value: Notification) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var notifications: [Notification?]? {
        get {
          return (resultMap["notifications"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Notification?] in value.map { (value: ResultMap?) -> Notification? in value.flatMap { (value: ResultMap) -> Notification in Notification(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Notification?]) -> [ResultMap?] in value.map { (value: Notification?) -> ResultMap? in value.flatMap { (value: Notification) -> ResultMap in value.resultMap } } }, forKey: "notifications")
        }
      }

      public struct Notification: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AiringNotification", "FollowingNotification", "ActivityMessageNotification", "ActivityMentionNotification", "ActivityReplyNotification", "ActivityReplySubscribedNotification", "ActivityLikeNotification", "ActivityReplyLikeNotification", "ThreadCommentMentionNotification", "ThreadCommentReplyNotification", "ThreadCommentSubscribedNotification", "ThreadCommentLikeNotification", "ThreadLikeNotification", "RelatedMediaAdditionNotification"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLTypeCase(
              variants: ["AiringNotification": AsAiringNotification.selections, "FollowingNotification": AsFollowingNotification.selections, "ActivityMessageNotification": AsActivityMessageNotification.selections, "ActivityMentionNotification": AsActivityMentionNotification.selections, "ActivityReplyNotification": AsActivityReplyNotification.selections, "ActivityReplySubscribedNotification": AsActivityReplySubscribedNotification.selections, "ActivityLikeNotification": AsActivityLikeNotification.selections, "ActivityReplyLikeNotification": AsActivityReplyLikeNotification.selections, "ThreadCommentMentionNotification": AsThreadCommentMentionNotification.selections, "ThreadCommentReplyNotification": AsThreadCommentReplyNotification.selections, "ThreadCommentSubscribedNotification": AsThreadCommentSubscribedNotification.selections, "ThreadCommentLikeNotification": AsThreadCommentLikeNotification.selections, "ThreadLikeNotification": AsThreadLikeNotification.selections, "RelatedMediaAdditionNotification": AsRelatedMediaAdditionNotification.selections],
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

        public static func makeAiringNotification(id: Int, episode: Int, createdAt: Int? = nil, media: AsAiringNotification.Medium? = nil) -> Notification {
          return Notification(unsafeResultMap: ["__typename": "AiringNotification", "id": id, "episode": episode, "createdAt": createdAt, "media": media.flatMap { (value: AsAiringNotification.Medium) -> ResultMap in value.resultMap }])
        }

        public static func makeFollowingNotification(id: Int, createdAt: Int? = nil, user: AsFollowingNotification.User? = nil) -> Notification {
          return Notification(unsafeResultMap: ["__typename": "FollowingNotification", "id": id, "createdAt": createdAt, "user": user.flatMap { (value: AsFollowingNotification.User) -> ResultMap in value.resultMap }])
        }

        public static func makeActivityMessageNotification(id: Int, createdAt: Int? = nil, user: AsActivityMessageNotification.User? = nil) -> Notification {
          return Notification(unsafeResultMap: ["__typename": "ActivityMessageNotification", "id": id, "createdAt": createdAt, "user": user.flatMap { (value: AsActivityMessageNotification.User) -> ResultMap in value.resultMap }])
        }

        public static func makeActivityMentionNotification(id: Int, createdAt: Int? = nil, user: AsActivityMentionNotification.User? = nil) -> Notification {
          return Notification(unsafeResultMap: ["__typename": "ActivityMentionNotification", "id": id, "createdAt": createdAt, "user": user.flatMap { (value: AsActivityMentionNotification.User) -> ResultMap in value.resultMap }])
        }

        public static func makeActivityReplyNotification(id: Int) -> Notification {
          return Notification(unsafeResultMap: ["__typename": "ActivityReplyNotification", "id": id])
        }

        public static func makeActivityReplySubscribedNotification(id: Int) -> Notification {
          return Notification(unsafeResultMap: ["__typename": "ActivityReplySubscribedNotification", "id": id])
        }

        public static func makeActivityLikeNotification(id: Int) -> Notification {
          return Notification(unsafeResultMap: ["__typename": "ActivityLikeNotification", "id": id])
        }

        public static func makeActivityReplyLikeNotification(id: Int) -> Notification {
          return Notification(unsafeResultMap: ["__typename": "ActivityReplyLikeNotification", "id": id])
        }

        public static func makeThreadCommentMentionNotification(id: Int) -> Notification {
          return Notification(unsafeResultMap: ["__typename": "ThreadCommentMentionNotification", "id": id])
        }

        public static func makeThreadCommentReplyNotification(id: Int) -> Notification {
          return Notification(unsafeResultMap: ["__typename": "ThreadCommentReplyNotification", "id": id])
        }

        public static func makeThreadCommentSubscribedNotification(id: Int) -> Notification {
          return Notification(unsafeResultMap: ["__typename": "ThreadCommentSubscribedNotification", "id": id])
        }

        public static func makeThreadCommentLikeNotification(id: Int) -> Notification {
          return Notification(unsafeResultMap: ["__typename": "ThreadCommentLikeNotification", "id": id])
        }

        public static func makeThreadLikeNotification(id: Int) -> Notification {
          return Notification(unsafeResultMap: ["__typename": "ThreadLikeNotification", "id": id])
        }

        public static func makeRelatedMediaAdditionNotification(id: Int) -> Notification {
          return Notification(unsafeResultMap: ["__typename": "RelatedMediaAdditionNotification", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var asAiringNotification: AsAiringNotification? {
          get {
            if !AsAiringNotification.possibleTypes.contains(__typename) { return nil }
            return AsAiringNotification(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsAiringNotification: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["AiringNotification"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("episode", type: .nonNull(.scalar(Int.self))),
              GraphQLField("createdAt", type: .scalar(Int.self)),
              GraphQLField("media", type: .object(Medium.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, episode: Int, createdAt: Int? = nil, media: Medium? = nil) {
            self.init(unsafeResultMap: ["__typename": "AiringNotification", "id": id, "episode": episode, "createdAt": createdAt, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the Notification
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The episode number that just aired
          public var episode: Int {
            get {
              return resultMap["episode"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "episode")
            }
          }

          /// The time the notification was created at
          public var createdAt: Int? {
            get {
              return resultMap["createdAt"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          /// The associated media of the airing schedule
          public var media: Medium? {
            get {
              return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "media")
            }
          }

          public struct Medium: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Media"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("title", type: .object(Title.selections)),
                GraphQLField("coverImage", type: .object(CoverImage.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, title: Title? = nil, coverImage: CoverImage? = nil) {
              self.init(unsafeResultMap: ["__typename": "Media", "id": id, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }])
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

            /// The official titles of the media in various languages
            public var title: Title? {
              get {
                return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "title")
              }
            }

            /// The cover images of the media
            public var coverImage: CoverImage? {
              get {
                return (resultMap["coverImage"] as? ResultMap).flatMap { CoverImage(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "coverImage")
              }
            }

            public struct Title: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MediaTitle"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("userPreferred", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(userPreferred: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "MediaTitle", "userPreferred": userPreferred])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The currently authenticated users preferred title language. Default romaji for non-authenticated
              public var userPreferred: String? {
                get {
                  return resultMap["userPreferred"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "userPreferred")
                }
              }
            }

            public struct CoverImage: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MediaCoverImage"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("color", type: .scalar(String.self)),
                  GraphQLField("extraLarge", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(color: String? = nil, extraLarge: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "MediaCoverImage", "color": color, "extraLarge": extraLarge])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Average #hex color of cover image
              public var color: String? {
                get {
                  return resultMap["color"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "color")
                }
              }

              /// The cover image url of the media at its largest size. If this size isn't available, large will be provided instead.
              public var extraLarge: String? {
                get {
                  return resultMap["extraLarge"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "extraLarge")
                }
              }
            }
          }
        }

        public var asFollowingNotification: AsFollowingNotification? {
          get {
            if !AsFollowingNotification.possibleTypes.contains(__typename) { return nil }
            return AsFollowingNotification(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsFollowingNotification: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["FollowingNotification"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("createdAt", type: .scalar(Int.self)),
              GraphQLField("user", type: .object(User.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, createdAt: Int? = nil, user: User? = nil) {
            self.init(unsafeResultMap: ["__typename": "FollowingNotification", "id": id, "createdAt": createdAt, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the Notification
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The time the notification was created at
          public var createdAt: Int? {
            get {
              return resultMap["createdAt"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          /// The liked activity
          public var user: User? {
            get {
              return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "user")
            }
          }

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatar", type: .object(Avatar.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, name: String, avatar: Avatar? = nil) {
              self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The id of the user
            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
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

            /// The user's avatar images
            public var avatar: Avatar? {
              get {
                return (resultMap["avatar"] as? ResultMap).flatMap { Avatar(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "avatar")
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
          }
        }

        public var asActivityMessageNotification: AsActivityMessageNotification? {
          get {
            if !AsActivityMessageNotification.possibleTypes.contains(__typename) { return nil }
            return AsActivityMessageNotification(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsActivityMessageNotification: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ActivityMessageNotification"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("createdAt", type: .scalar(Int.self)),
              GraphQLField("user", type: .object(User.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, createdAt: Int? = nil, user: User? = nil) {
            self.init(unsafeResultMap: ["__typename": "ActivityMessageNotification", "id": id, "createdAt": createdAt, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the Notification
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The time the notification was created at
          public var createdAt: Int? {
            get {
              return resultMap["createdAt"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          /// The user who sent the message
          public var user: User? {
            get {
              return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "user")
            }
          }

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatar", type: .object(Avatar.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, name: String, avatar: Avatar? = nil) {
              self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The id of the user
            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
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

            /// The user's avatar images
            public var avatar: Avatar? {
              get {
                return (resultMap["avatar"] as? ResultMap).flatMap { Avatar(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "avatar")
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
          }
        }

        public var asActivityMentionNotification: AsActivityMentionNotification? {
          get {
            if !AsActivityMentionNotification.possibleTypes.contains(__typename) { return nil }
            return AsActivityMentionNotification(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsActivityMentionNotification: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ActivityMentionNotification"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("createdAt", type: .scalar(Int.self)),
              GraphQLField("user", type: .object(User.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, createdAt: Int? = nil, user: User? = nil) {
            self.init(unsafeResultMap: ["__typename": "ActivityMentionNotification", "id": id, "createdAt": createdAt, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the Notification
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The time the notification was created at
          public var createdAt: Int? {
            get {
              return resultMap["createdAt"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          /// The user who mentioned the authenticated user
          public var user: User? {
            get {
              return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "user")
            }
          }

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatar", type: .object(Avatar.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, name: String, avatar: Avatar? = nil) {
              self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The id of the user
            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
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

            /// The user's avatar images
            public var avatar: Avatar? {
              get {
                return (resultMap["avatar"] as? ResultMap).flatMap { Avatar(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "avatar")
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
          }
        }

        public var asActivityReplyNotification: AsActivityReplyNotification? {
          get {
            if !AsActivityReplyNotification.possibleTypes.contains(__typename) { return nil }
            return AsActivityReplyNotification(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsActivityReplyNotification: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ActivityReplyNotification"]

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
            self.init(unsafeResultMap: ["__typename": "ActivityReplyNotification", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the Notification
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }

        public var asActivityReplySubscribedNotification: AsActivityReplySubscribedNotification? {
          get {
            if !AsActivityReplySubscribedNotification.possibleTypes.contains(__typename) { return nil }
            return AsActivityReplySubscribedNotification(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsActivityReplySubscribedNotification: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ActivityReplySubscribedNotification"]

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
            self.init(unsafeResultMap: ["__typename": "ActivityReplySubscribedNotification", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the Notification
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }

        public var asActivityLikeNotification: AsActivityLikeNotification? {
          get {
            if !AsActivityLikeNotification.possibleTypes.contains(__typename) { return nil }
            return AsActivityLikeNotification(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsActivityLikeNotification: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ActivityLikeNotification"]

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
            self.init(unsafeResultMap: ["__typename": "ActivityLikeNotification", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the Notification
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }

        public var asActivityReplyLikeNotification: AsActivityReplyLikeNotification? {
          get {
            if !AsActivityReplyLikeNotification.possibleTypes.contains(__typename) { return nil }
            return AsActivityReplyLikeNotification(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsActivityReplyLikeNotification: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ActivityReplyLikeNotification"]

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
            self.init(unsafeResultMap: ["__typename": "ActivityReplyLikeNotification", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the Notification
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }

        public var asThreadCommentMentionNotification: AsThreadCommentMentionNotification? {
          get {
            if !AsThreadCommentMentionNotification.possibleTypes.contains(__typename) { return nil }
            return AsThreadCommentMentionNotification(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsThreadCommentMentionNotification: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ThreadCommentMentionNotification"]

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
            self.init(unsafeResultMap: ["__typename": "ThreadCommentMentionNotification", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the Notification
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }

        public var asThreadCommentReplyNotification: AsThreadCommentReplyNotification? {
          get {
            if !AsThreadCommentReplyNotification.possibleTypes.contains(__typename) { return nil }
            return AsThreadCommentReplyNotification(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsThreadCommentReplyNotification: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ThreadCommentReplyNotification"]

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
            self.init(unsafeResultMap: ["__typename": "ThreadCommentReplyNotification", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the Notification
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }

        public var asThreadCommentSubscribedNotification: AsThreadCommentSubscribedNotification? {
          get {
            if !AsThreadCommentSubscribedNotification.possibleTypes.contains(__typename) { return nil }
            return AsThreadCommentSubscribedNotification(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsThreadCommentSubscribedNotification: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ThreadCommentSubscribedNotification"]

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
            self.init(unsafeResultMap: ["__typename": "ThreadCommentSubscribedNotification", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the Notification
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }

        public var asThreadCommentLikeNotification: AsThreadCommentLikeNotification? {
          get {
            if !AsThreadCommentLikeNotification.possibleTypes.contains(__typename) { return nil }
            return AsThreadCommentLikeNotification(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsThreadCommentLikeNotification: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ThreadCommentLikeNotification"]

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
            self.init(unsafeResultMap: ["__typename": "ThreadCommentLikeNotification", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the Notification
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }

        public var asThreadLikeNotification: AsThreadLikeNotification? {
          get {
            if !AsThreadLikeNotification.possibleTypes.contains(__typename) { return nil }
            return AsThreadLikeNotification(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsThreadLikeNotification: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ThreadLikeNotification"]

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
            self.init(unsafeResultMap: ["__typename": "ThreadLikeNotification", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the Notification
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }

        public var asRelatedMediaAdditionNotification: AsRelatedMediaAdditionNotification? {
          get {
            if !AsRelatedMediaAdditionNotification.possibleTypes.contains(__typename) { return nil }
            return AsRelatedMediaAdditionNotification(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsRelatedMediaAdditionNotification: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["RelatedMediaAdditionNotification"]

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
            self.init(unsafeResultMap: ["__typename": "RelatedMediaAdditionNotification", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the Notification
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
}
