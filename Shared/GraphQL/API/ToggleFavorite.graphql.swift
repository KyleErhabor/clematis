// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ToggleFavoriteMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation ToggleFavorite($animeId: Int, $mangaId: Int, $characterId: Int, $staffId: Int, $studioId: Int) {
      ToggleFavourite(
        animeId: $animeId
        mangaId: $mangaId
        characterId: $characterId
        staffId: $staffId
        studioId: $studioId
      ) {
        __typename
        anime {
          __typename
          pageInfo {
            __typename
            total
          }
        }
      }
    }
    """

  public let operationName: String = "ToggleFavorite"

  public var animeId: Int?
  public var mangaId: Int?
  public var characterId: Int?
  public var staffId: Int?
  public var studioId: Int?

  public init(animeId: Int? = nil, mangaId: Int? = nil, characterId: Int? = nil, staffId: Int? = nil, studioId: Int? = nil) {
    self.animeId = animeId
    self.mangaId = mangaId
    self.characterId = characterId
    self.staffId = staffId
    self.studioId = studioId
  }

  public var variables: GraphQLMap? {
    return ["animeId": animeId, "mangaId": mangaId, "characterId": characterId, "staffId": staffId, "studioId": studioId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("ToggleFavourite", arguments: ["animeId": GraphQLVariable("animeId"), "mangaId": GraphQLVariable("mangaId"), "characterId": GraphQLVariable("characterId"), "staffId": GraphQLVariable("staffId"), "studioId": GraphQLVariable("studioId")], type: .object(ToggleFavourite.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(toggleFavourite: ToggleFavourite? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "ToggleFavourite": toggleFavourite.flatMap { (value: ToggleFavourite) -> ResultMap in value.resultMap }])
    }

    /// Favourite or unfavourite an anime, manga, character, staff member, or studio
    public var toggleFavourite: ToggleFavourite? {
      get {
        return (resultMap["ToggleFavourite"] as? ResultMap).flatMap { ToggleFavourite(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "ToggleFavourite")
      }
    }

    public struct ToggleFavourite: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Favourites"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("anime", type: .object(Anime.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(anime: Anime? = nil) {
        self.init(unsafeResultMap: ["__typename": "Favourites", "anime": anime.flatMap { (value: Anime) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Favourite anime
      public var anime: Anime? {
        get {
          return (resultMap["anime"] as? ResultMap).flatMap { Anime(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "anime")
        }
      }

      public struct Anime: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pageInfo", type: .object(PageInfo.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pageInfo: PageInfo? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaConnection", "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }])
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

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PageInfo"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("total", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(total: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "PageInfo", "total": total])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The total number of items
          public var total: Int? {
            get {
              return resultMap["total"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "total")
            }
          }
        }
      }
    }
  }
}
