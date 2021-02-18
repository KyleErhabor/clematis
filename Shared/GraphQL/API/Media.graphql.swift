// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class MediaQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Media($id: Int!, $staffPage: Int, $characterPage: Int) {
      Media(id: $id) {
        __typename
        type
        format
        genres
        season
        hashtag
        siteUrl
        volumes
        chapters
        duration
        episodes
        isLocked
        synonyms
        meanScore
        updatedAt
        favourites
        isLicensed
        popularity
        seasonYear
        bannerImage
        isFavourite
        averageScore
        countryOfOrigin
        source(version: 2)
        status(version: 2)
        description(asHtml: true)
        mediaListEntry {
          __typename
          status
        }
        coverImage {
          __typename
          color
          extraLarge
        }
        nextAiringEpisode {
          __typename
          episode
          timeUntilAiring
        }
        startDate {
          __typename
          day
          year
          month
        }
        endDate {
          __typename
          day
          year
          month
        }
        trailer {
          __typename
          id
          site
          thumbnail
        }
        externalLinks {
          __typename
          id
          url
          site
        }
        title {
          __typename
          native
          romaji
          english
          userPreferred
        }
        tags {
          __typename
          id
          name
          rank
          isAdult
          description
          isMediaSpoiler
        }
        rankings {
          __typename
          id
          rank
          type
          year
          format
          season
          allTime
          context
        }
        reviews(sort: RATING_DESC) {
          __typename
          pageInfo {
            __typename
            total
            hasNextPage
          }
          nodes {
            __typename
            id
            rating
            private
            summary
            createdAt
            userRating
            ratingAmount
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
        }
        studios {
          __typename
          edges {
            __typename
            id
            isMain
            node {
              __typename
              id
              name
              isFavourite
            }
          }
        }
        staff(page: $staffPage) {
          __typename
          pageInfo {
            __typename
            total
            hasNextPage
          }
          edges {
            __typename
            id
            role
            node {
              __typename
              id
              isFavourite
              image {
                __typename
                large
              }
              name {
                __typename
                full
                native
              }
            }
          }
        }
        relations {
          __typename
          pageInfo {
            __typename
            total
          }
          edges {
            __typename
            id
            relationType(version: 2)
            node {
              __typename
              id
              type
              format
              season
              status
              seasonYear
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
        }
        characters(page: $characterPage, sort: [ROLE, ID]) {
          __typename
          pageInfo {
            __typename
            total
            hasNextPage
          }
          edges {
            __typename
            id
            role
            node {
              __typename
              id
              isFavourite
              image {
                __typename
                large
              }
              name {
                __typename
                full
                native
              }
            }
            voiceActors(sort: LANGUAGE) {
              __typename
              id
              language
              isFavourite
              image {
                __typename
                large
              }
              name {
                __typename
                full
                native
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "Media"

  public var id: Int
  public var staffPage: Int?
  public var characterPage: Int?

  public init(id: Int, staffPage: Int? = nil, characterPage: Int? = nil) {
    self.id = id
    self.staffPage = staffPage
    self.characterPage = characterPage
  }

  public var variables: GraphQLMap? {
    return ["id": id, "staffPage": staffPage, "characterPage": characterPage]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Media", arguments: ["id": GraphQLVariable("id")], type: .object(Medium.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(media: Medium? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
    }

    /// Media query
    public var media: Medium? {
      get {
        return (resultMap["Media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Media")
      }
    }

    public struct Medium: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Media"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .scalar(MediaType.self)),
          GraphQLField("format", type: .scalar(MediaFormat.self)),
          GraphQLField("genres", type: .list(.scalar(String.self))),
          GraphQLField("season", type: .scalar(MediaSeason.self)),
          GraphQLField("hashtag", type: .scalar(String.self)),
          GraphQLField("siteUrl", type: .scalar(String.self)),
          GraphQLField("volumes", type: .scalar(Int.self)),
          GraphQLField("chapters", type: .scalar(Int.self)),
          GraphQLField("duration", type: .scalar(Int.self)),
          GraphQLField("episodes", type: .scalar(Int.self)),
          GraphQLField("isLocked", type: .scalar(Bool.self)),
          GraphQLField("synonyms", type: .list(.scalar(String.self))),
          GraphQLField("meanScore", type: .scalar(Int.self)),
          GraphQLField("updatedAt", type: .scalar(Int.self)),
          GraphQLField("favourites", type: .scalar(Int.self)),
          GraphQLField("isLicensed", type: .scalar(Bool.self)),
          GraphQLField("popularity", type: .scalar(Int.self)),
          GraphQLField("seasonYear", type: .scalar(Int.self)),
          GraphQLField("bannerImage", type: .scalar(String.self)),
          GraphQLField("isFavourite", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("averageScore", type: .scalar(Int.self)),
          GraphQLField("countryOfOrigin", type: .scalar(CountryCode.self)),
          GraphQLField("source", arguments: ["version": 2], type: .scalar(MediaSource.self)),
          GraphQLField("status", arguments: ["version": 2], type: .scalar(MediaStatus.self)),
          GraphQLField("description", arguments: ["asHtml": true], type: .scalar(String.self)),
          GraphQLField("mediaListEntry", type: .object(MediaListEntry.selections)),
          GraphQLField("coverImage", type: .object(CoverImage.selections)),
          GraphQLField("nextAiringEpisode", type: .object(NextAiringEpisode.selections)),
          GraphQLField("startDate", type: .object(StartDate.selections)),
          GraphQLField("endDate", type: .object(EndDate.selections)),
          GraphQLField("trailer", type: .object(Trailer.selections)),
          GraphQLField("externalLinks", type: .list(.object(ExternalLink.selections))),
          GraphQLField("title", type: .object(Title.selections)),
          GraphQLField("tags", type: .list(.object(Tag.selections))),
          GraphQLField("rankings", type: .list(.object(Ranking.selections))),
          GraphQLField("reviews", arguments: ["sort": "RATING_DESC"], type: .object(Review.selections)),
          GraphQLField("studios", type: .object(Studio.selections)),
          GraphQLField("staff", arguments: ["page": GraphQLVariable("staffPage")], type: .object(Staff.selections)),
          GraphQLField("relations", type: .object(Relation.selections)),
          GraphQLField("characters", arguments: ["page": GraphQLVariable("characterPage"), "sort": ["ROLE", "ID"]], type: .object(Character.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(type: MediaType? = nil, format: MediaFormat? = nil, genres: [String?]? = nil, season: MediaSeason? = nil, hashtag: String? = nil, siteUrl: String? = nil, volumes: Int? = nil, chapters: Int? = nil, duration: Int? = nil, episodes: Int? = nil, isLocked: Bool? = nil, synonyms: [String?]? = nil, meanScore: Int? = nil, updatedAt: Int? = nil, favourites: Int? = nil, isLicensed: Bool? = nil, popularity: Int? = nil, seasonYear: Int? = nil, bannerImage: String? = nil, isFavourite: Bool, averageScore: Int? = nil, countryOfOrigin: CountryCode? = nil, source: MediaSource? = nil, status: MediaStatus? = nil, description: String? = nil, mediaListEntry: MediaListEntry? = nil, coverImage: CoverImage? = nil, nextAiringEpisode: NextAiringEpisode? = nil, startDate: StartDate? = nil, endDate: EndDate? = nil, trailer: Trailer? = nil, externalLinks: [ExternalLink?]? = nil, title: Title? = nil, tags: [Tag?]? = nil, rankings: [Ranking?]? = nil, reviews: Review? = nil, studios: Studio? = nil, staff: Staff? = nil, relations: Relation? = nil, characters: Character? = nil) {
        self.init(unsafeResultMap: ["__typename": "Media", "type": type, "format": format, "genres": genres, "season": season, "hashtag": hashtag, "siteUrl": siteUrl, "volumes": volumes, "chapters": chapters, "duration": duration, "episodes": episodes, "isLocked": isLocked, "synonyms": synonyms, "meanScore": meanScore, "updatedAt": updatedAt, "favourites": favourites, "isLicensed": isLicensed, "popularity": popularity, "seasonYear": seasonYear, "bannerImage": bannerImage, "isFavourite": isFavourite, "averageScore": averageScore, "countryOfOrigin": countryOfOrigin, "source": source, "status": status, "description": description, "mediaListEntry": mediaListEntry.flatMap { (value: MediaListEntry) -> ResultMap in value.resultMap }, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }, "nextAiringEpisode": nextAiringEpisode.flatMap { (value: NextAiringEpisode) -> ResultMap in value.resultMap }, "startDate": startDate.flatMap { (value: StartDate) -> ResultMap in value.resultMap }, "endDate": endDate.flatMap { (value: EndDate) -> ResultMap in value.resultMap }, "trailer": trailer.flatMap { (value: Trailer) -> ResultMap in value.resultMap }, "externalLinks": externalLinks.flatMap { (value: [ExternalLink?]) -> [ResultMap?] in value.map { (value: ExternalLink?) -> ResultMap? in value.flatMap { (value: ExternalLink) -> ResultMap in value.resultMap } } }, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "tags": tags.flatMap { (value: [Tag?]) -> [ResultMap?] in value.map { (value: Tag?) -> ResultMap? in value.flatMap { (value: Tag) -> ResultMap in value.resultMap } } }, "rankings": rankings.flatMap { (value: [Ranking?]) -> [ResultMap?] in value.map { (value: Ranking?) -> ResultMap? in value.flatMap { (value: Ranking) -> ResultMap in value.resultMap } } }, "reviews": reviews.flatMap { (value: Review) -> ResultMap in value.resultMap }, "studios": studios.flatMap { (value: Studio) -> ResultMap in value.resultMap }, "staff": staff.flatMap { (value: Staff) -> ResultMap in value.resultMap }, "relations": relations.flatMap { (value: Relation) -> ResultMap in value.resultMap }, "characters": characters.flatMap { (value: Character) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The type of the media; anime or manga
      public var type: MediaType? {
        get {
          return resultMap["type"] as? MediaType
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      /// The format the media was released in
      public var format: MediaFormat? {
        get {
          return resultMap["format"] as? MediaFormat
        }
        set {
          resultMap.updateValue(newValue, forKey: "format")
        }
      }

      /// The genres of the media
      public var genres: [String?]? {
        get {
          return resultMap["genres"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "genres")
        }
      }

      /// The season the media was initially released in
      public var season: MediaSeason? {
        get {
          return resultMap["season"] as? MediaSeason
        }
        set {
          resultMap.updateValue(newValue, forKey: "season")
        }
      }

      /// Official Twitter hashtags for the media
      public var hashtag: String? {
        get {
          return resultMap["hashtag"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "hashtag")
        }
      }

      /// The url for the media page on the AniList website
      public var siteUrl: String? {
        get {
          return resultMap["siteUrl"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "siteUrl")
        }
      }

      /// The amount of volumes the manga has when complete
      public var volumes: Int? {
        get {
          return resultMap["volumes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "volumes")
        }
      }

      /// The amount of chapters the manga has when complete
      public var chapters: Int? {
        get {
          return resultMap["chapters"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "chapters")
        }
      }

      /// The general length of each anime episode in minutes
      public var duration: Int? {
        get {
          return resultMap["duration"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "duration")
        }
      }

      /// The amount of episodes the anime has when complete
      public var episodes: Int? {
        get {
          return resultMap["episodes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "episodes")
        }
      }

      /// Locked media may not be added to lists our favorited. This may be due to the entry pending for deletion or other reasons.
      public var isLocked: Bool? {
        get {
          return resultMap["isLocked"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isLocked")
        }
      }

      /// Alternative titles of the media
      public var synonyms: [String?]? {
        get {
          return resultMap["synonyms"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "synonyms")
        }
      }

      /// Mean score of all the user's scores of the media
      public var meanScore: Int? {
        get {
          return resultMap["meanScore"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "meanScore")
        }
      }

      /// When the media's data was last updated
      public var updatedAt: Int? {
        get {
          return resultMap["updatedAt"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }

      /// The amount of user's who have favourited the media
      public var favourites: Int? {
        get {
          return resultMap["favourites"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "favourites")
        }
      }

      /// If the media is officially licensed or a self-published doujin release
      public var isLicensed: Bool? {
        get {
          return resultMap["isLicensed"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isLicensed")
        }
      }

      /// The number of users with the media on their list
      public var popularity: Int? {
        get {
          return resultMap["popularity"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "popularity")
        }
      }

      /// The season year the media was initially released in
      public var seasonYear: Int? {
        get {
          return resultMap["seasonYear"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "seasonYear")
        }
      }

      /// The banner image of the media
      public var bannerImage: String? {
        get {
          return resultMap["bannerImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "bannerImage")
        }
      }

      /// If the media is marked as favourite by the current authenticated user
      public var isFavourite: Bool {
        get {
          return resultMap["isFavourite"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isFavourite")
        }
      }

      /// A weighted average score of all the user's scores of the media
      public var averageScore: Int? {
        get {
          return resultMap["averageScore"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "averageScore")
        }
      }

      /// Where the media was created. (ISO 3166-1 alpha-2)
      public var countryOfOrigin: CountryCode? {
        get {
          return resultMap["countryOfOrigin"] as? CountryCode
        }
        set {
          resultMap.updateValue(newValue, forKey: "countryOfOrigin")
        }
      }

      /// Source type the media was adapted from.
      public var source: MediaSource? {
        get {
          return resultMap["source"] as? MediaSource
        }
        set {
          resultMap.updateValue(newValue, forKey: "source")
        }
      }

      /// The current releasing status of the media
      public var status: MediaStatus? {
        get {
          return resultMap["status"] as? MediaStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      /// Short description of the media's story and characters
      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      /// The authenticated user's media list entry for the media
      public var mediaListEntry: MediaListEntry? {
        get {
          return (resultMap["mediaListEntry"] as? ResultMap).flatMap { MediaListEntry(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "mediaListEntry")
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

      /// The media's next episode airing schedule
      public var nextAiringEpisode: NextAiringEpisode? {
        get {
          return (resultMap["nextAiringEpisode"] as? ResultMap).flatMap { NextAiringEpisode(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "nextAiringEpisode")
        }
      }

      /// The first official release date of the media
      public var startDate: StartDate? {
        get {
          return (resultMap["startDate"] as? ResultMap).flatMap { StartDate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "startDate")
        }
      }

      /// The last official release date of the media
      public var endDate: EndDate? {
        get {
          return (resultMap["endDate"] as? ResultMap).flatMap { EndDate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "endDate")
        }
      }

      /// Media trailer or advertisement
      public var trailer: Trailer? {
        get {
          return (resultMap["trailer"] as? ResultMap).flatMap { Trailer(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "trailer")
        }
      }

      /// External links to another site related to the media
      public var externalLinks: [ExternalLink?]? {
        get {
          return (resultMap["externalLinks"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ExternalLink?] in value.map { (value: ResultMap?) -> ExternalLink? in value.flatMap { (value: ResultMap) -> ExternalLink in ExternalLink(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ExternalLink?]) -> [ResultMap?] in value.map { (value: ExternalLink?) -> ResultMap? in value.flatMap { (value: ExternalLink) -> ResultMap in value.resultMap } } }, forKey: "externalLinks")
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

      /// List of tags that describes elements and themes of the media
      public var tags: [Tag?]? {
        get {
          return (resultMap["tags"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Tag?] in value.map { (value: ResultMap?) -> Tag? in value.flatMap { (value: ResultMap) -> Tag in Tag(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Tag?]) -> [ResultMap?] in value.map { (value: Tag?) -> ResultMap? in value.flatMap { (value: Tag) -> ResultMap in value.resultMap } } }, forKey: "tags")
        }
      }

      /// The ranking of the media in a particular time span and format compared to other media
      public var rankings: [Ranking?]? {
        get {
          return (resultMap["rankings"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Ranking?] in value.map { (value: ResultMap?) -> Ranking? in value.flatMap { (value: ResultMap) -> Ranking in Ranking(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Ranking?]) -> [ResultMap?] in value.map { (value: Ranking?) -> ResultMap? in value.flatMap { (value: Ranking) -> ResultMap in value.resultMap } } }, forKey: "rankings")
        }
      }

      /// User reviews of the media
      public var reviews: Review? {
        get {
          return (resultMap["reviews"] as? ResultMap).flatMap { Review(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "reviews")
        }
      }

      /// The companies who produced the media
      public var studios: Studio? {
        get {
          return (resultMap["studios"] as? ResultMap).flatMap { Studio(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "studios")
        }
      }

      /// The staff who produced the media
      public var staff: Staff? {
        get {
          return (resultMap["staff"] as? ResultMap).flatMap { Staff(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "staff")
        }
      }

      /// Other media in the same or connecting franchise
      public var relations: Relation? {
        get {
          return (resultMap["relations"] as? ResultMap).flatMap { Relation(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "relations")
        }
      }

      /// The characters in the media
      public var characters: Character? {
        get {
          return (resultMap["characters"] as? ResultMap).flatMap { Character(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "characters")
        }
      }

      public struct MediaListEntry: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaList"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("status", type: .scalar(MediaListStatus.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(status: MediaListStatus? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaList", "status": status])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The watching/reading status
        public var status: MediaListStatus? {
          get {
            return resultMap["status"] as? MediaListStatus
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
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

      public struct NextAiringEpisode: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AiringSchedule"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("episode", type: .nonNull(.scalar(Int.self))),
            GraphQLField("timeUntilAiring", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(episode: Int, timeUntilAiring: Int) {
          self.init(unsafeResultMap: ["__typename": "AiringSchedule", "episode": episode, "timeUntilAiring": timeUntilAiring])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The airing episode number
        public var episode: Int {
          get {
            return resultMap["episode"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "episode")
          }
        }

        /// Seconds until episode starts airing
        public var timeUntilAiring: Int {
          get {
            return resultMap["timeUntilAiring"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "timeUntilAiring")
          }
        }
      }

      public struct StartDate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FuzzyDate"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("day", type: .scalar(Int.self)),
            GraphQLField("year", type: .scalar(Int.self)),
            GraphQLField("month", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(day: Int? = nil, year: Int? = nil, month: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "FuzzyDate", "day": day, "year": year, "month": month])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Numeric Day (24)
        public var day: Int? {
          get {
            return resultMap["day"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "day")
          }
        }

        /// Numeric Year (2017)
        public var year: Int? {
          get {
            return resultMap["year"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "year")
          }
        }

        /// Numeric Month (3)
        public var month: Int? {
          get {
            return resultMap["month"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "month")
          }
        }
      }

      public struct EndDate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FuzzyDate"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("day", type: .scalar(Int.self)),
            GraphQLField("year", type: .scalar(Int.self)),
            GraphQLField("month", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(day: Int? = nil, year: Int? = nil, month: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "FuzzyDate", "day": day, "year": year, "month": month])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Numeric Day (24)
        public var day: Int? {
          get {
            return resultMap["day"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "day")
          }
        }

        /// Numeric Year (2017)
        public var year: Int? {
          get {
            return resultMap["year"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "year")
          }
        }

        /// Numeric Month (3)
        public var month: Int? {
          get {
            return resultMap["month"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "month")
          }
        }
      }

      public struct Trailer: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaTrailer"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(String.self)),
            GraphQLField("site", type: .scalar(String.self)),
            GraphQLField("thumbnail", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String? = nil, site: String? = nil, thumbnail: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaTrailer", "id": id, "site": site, "thumbnail": thumbnail])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The trailer video id
        public var id: String? {
          get {
            return resultMap["id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The site the video is hosted by (Currently either youtube or dailymotion)
        public var site: String? {
          get {
            return resultMap["site"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "site")
          }
        }

        /// The url for the thumbnail image of the video
        public var thumbnail: String? {
          get {
            return resultMap["thumbnail"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "thumbnail")
          }
        }
      }

      public struct ExternalLink: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaExternalLink"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("url", type: .nonNull(.scalar(String.self))),
            GraphQLField("site", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, url: String, site: String) {
          self.init(unsafeResultMap: ["__typename": "MediaExternalLink", "id": id, "url": url, "site": site])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the external link
        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The url of the external link
        public var url: String {
          get {
            return resultMap["url"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }

        /// The site location of the external link
        public var site: String {
          get {
            return resultMap["site"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "site")
          }
        }
      }

      public struct Title: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaTitle"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("native", type: .scalar(String.self)),
            GraphQLField("romaji", type: .scalar(String.self)),
            GraphQLField("english", type: .scalar(String.self)),
            GraphQLField("userPreferred", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(native: String? = nil, romaji: String? = nil, english: String? = nil, userPreferred: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaTitle", "native": native, "romaji": romaji, "english": english, "userPreferred": userPreferred])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Official title in it's native language
        public var native: String? {
          get {
            return resultMap["native"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "native")
          }
        }

        /// The romanization of the native language title
        public var romaji: String? {
          get {
            return resultMap["romaji"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "romaji")
          }
        }

        /// The official english title
        public var english: String? {
          get {
            return resultMap["english"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "english")
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

      public struct Tag: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaTag"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("rank", type: .scalar(Int.self)),
            GraphQLField("isAdult", type: .scalar(Bool.self)),
            GraphQLField("description", type: .scalar(String.self)),
            GraphQLField("isMediaSpoiler", type: .scalar(Bool.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, name: String, rank: Int? = nil, isAdult: Bool? = nil, description: String? = nil, isMediaSpoiler: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaTag", "id": id, "name": name, "rank": rank, "isAdult": isAdult, "description": description, "isMediaSpoiler": isMediaSpoiler])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the tag
        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The name of the tag
        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The relevance ranking of the tag out of the 100 for this media
        public var rank: Int? {
          get {
            return resultMap["rank"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "rank")
          }
        }

        /// If the tag is only for adult 18+ media
        public var isAdult: Bool? {
          get {
            return resultMap["isAdult"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isAdult")
          }
        }

        /// A general description of the tag
        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        /// If the tag is a spoiler for this media
        public var isMediaSpoiler: Bool? {
          get {
            return resultMap["isMediaSpoiler"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isMediaSpoiler")
          }
        }
      }

      public struct Ranking: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaRank"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("rank", type: .nonNull(.scalar(Int.self))),
            GraphQLField("type", type: .nonNull(.scalar(MediaRankType.self))),
            GraphQLField("year", type: .scalar(Int.self)),
            GraphQLField("format", type: .nonNull(.scalar(MediaFormat.self))),
            GraphQLField("season", type: .scalar(MediaSeason.self)),
            GraphQLField("allTime", type: .scalar(Bool.self)),
            GraphQLField("context", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, rank: Int, type: MediaRankType, year: Int? = nil, format: MediaFormat, season: MediaSeason? = nil, allTime: Bool? = nil, context: String) {
          self.init(unsafeResultMap: ["__typename": "MediaRank", "id": id, "rank": rank, "type": type, "year": year, "format": format, "season": season, "allTime": allTime, "context": context])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the rank
        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The numerical rank of the media
        public var rank: Int {
          get {
            return resultMap["rank"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "rank")
          }
        }

        /// The type of ranking
        public var type: MediaRankType {
          get {
            return resultMap["type"]! as! MediaRankType
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        /// The year the media is ranked within
        public var year: Int? {
          get {
            return resultMap["year"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "year")
          }
        }

        /// The format the media is ranked within
        public var format: MediaFormat {
          get {
            return resultMap["format"]! as! MediaFormat
          }
          set {
            resultMap.updateValue(newValue, forKey: "format")
          }
        }

        /// The season the media is ranked within
        public var season: MediaSeason? {
          get {
            return resultMap["season"] as? MediaSeason
          }
          set {
            resultMap.updateValue(newValue, forKey: "season")
          }
        }

        /// If the ranking is based on all time instead of a season/year
        public var allTime: Bool? {
          get {
            return resultMap["allTime"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "allTime")
          }
        }

        /// String that gives context to the ranking type and time span
        public var context: String {
          get {
            return resultMap["context"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "context")
          }
        }
      }

      public struct Review: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ReviewConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pageInfo", type: .object(PageInfo.selections)),
            GraphQLField("nodes", type: .list(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pageInfo: PageInfo? = nil, nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "ReviewConnection", "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }, "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
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

        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PageInfo"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("total", type: .scalar(Int.self)),
              GraphQLField("hasNextPage", type: .scalar(Bool.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(total: Int? = nil, hasNextPage: Bool? = nil) {
            self.init(unsafeResultMap: ["__typename": "PageInfo", "total": total, "hasNextPage": hasNextPage])
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

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Review"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("rating", type: .scalar(Int.self)),
              GraphQLField("private", type: .scalar(Bool.self)),
              GraphQLField("summary", type: .scalar(String.self)),
              GraphQLField("createdAt", type: .nonNull(.scalar(Int.self))),
              GraphQLField("userRating", type: .scalar(ReviewRating.self)),
              GraphQLField("ratingAmount", type: .scalar(Int.self)),
              GraphQLField("user", type: .object(User.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, rating: Int? = nil, `private`: Bool? = nil, summary: String? = nil, createdAt: Int, userRating: ReviewRating? = nil, ratingAmount: Int? = nil, user: User? = nil) {
            self.init(unsafeResultMap: ["__typename": "Review", "id": id, "rating": rating, "private": `private`, "summary": summary, "createdAt": createdAt, "userRating": userRating, "ratingAmount": ratingAmount, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the review
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The total user rating of the review
          public var rating: Int? {
            get {
              return resultMap["rating"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "rating")
            }
          }

          /// If the review is not yet publicly published and is only viewable by creator
          public var `private`: Bool? {
            get {
              return resultMap["private"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "private")
            }
          }

          /// A short summary of the review
          public var summary: String? {
            get {
              return resultMap["summary"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "summary")
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

          /// The rating of the review by currently authenticated user
          public var userRating: ReviewRating? {
            get {
              return resultMap["userRating"] as? ReviewRating
            }
            set {
              resultMap.updateValue(newValue, forKey: "userRating")
            }
          }

          /// The amount of user ratings of the review
          public var ratingAmount: Int? {
            get {
              return resultMap["ratingAmount"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "ratingAmount")
            }
          }

          /// The creator of the review
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
      }

      public struct Studio: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["StudioConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "StudioConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["StudioEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(Int.self)),
              GraphQLField("isMain", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("node", type: .object(Node.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int? = nil, isMain: Bool, node: Node? = nil) {
            self.init(unsafeResultMap: ["__typename": "StudioEdge", "id": id, "isMain": isMain, "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the connection
          public var id: Int? {
            get {
              return resultMap["id"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// If the studio is the main animation studio of the anime
          public var isMain: Bool {
            get {
              return resultMap["isMain"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isMain")
            }
          }

          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Studio"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("isFavourite", type: .nonNull(.scalar(Bool.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, name: String, isFavourite: Bool) {
              self.init(unsafeResultMap: ["__typename": "Studio", "id": id, "name": name, "isFavourite": isFavourite])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The id of the studio
            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The name of the studio
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// If the studio is marked as favourite by the currently authenticated user
            public var isFavourite: Bool {
              get {
                return resultMap["isFavourite"]! as! Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "isFavourite")
              }
            }
          }
        }
      }

      public struct Staff: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["StaffConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pageInfo", type: .object(PageInfo.selections)),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pageInfo: PageInfo? = nil, edges: [Edge?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "StaffConnection", "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
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

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PageInfo"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("total", type: .scalar(Int.self)),
              GraphQLField("hasNextPage", type: .scalar(Bool.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(total: Int? = nil, hasNextPage: Bool? = nil) {
            self.init(unsafeResultMap: ["__typename": "PageInfo", "total": total, "hasNextPage": hasNextPage])
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

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["StaffEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(Int.self)),
              GraphQLField("role", type: .scalar(String.self)),
              GraphQLField("node", type: .object(Node.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int? = nil, role: String? = nil, node: Node? = nil) {
            self.init(unsafeResultMap: ["__typename": "StaffEdge", "id": id, "role": role, "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the connection
          public var id: Int? {
            get {
              return resultMap["id"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The role of the staff member in the production of the media
          public var role: String? {
            get {
              return resultMap["role"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "role")
            }
          }

          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Staff"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("isFavourite", type: .nonNull(.scalar(Bool.self))),
                GraphQLField("image", type: .object(Image.selections)),
                GraphQLField("name", type: .object(Name.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, isFavourite: Bool, image: Image? = nil, name: Name? = nil) {
              self.init(unsafeResultMap: ["__typename": "Staff", "id": id, "isFavourite": isFavourite, "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "name": name.flatMap { (value: Name) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The id of the staff member
            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// If the staff member is marked as favourite by the currently authenticated user
            public var isFavourite: Bool {
              get {
                return resultMap["isFavourite"]! as! Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "isFavourite")
              }
            }

            /// The staff images
            public var image: Image? {
              get {
                return (resultMap["image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "image")
              }
            }

            /// The names of the staff member
            public var name: Name? {
              get {
                return (resultMap["name"] as? ResultMap).flatMap { Name(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "name")
              }
            }

            public struct Image: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["StaffImage"]

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
                self.init(unsafeResultMap: ["__typename": "StaffImage", "large": large])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The person's image of media at its largest size
              public var large: String? {
                get {
                  return resultMap["large"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "large")
                }
              }
            }

            public struct Name: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["StaffName"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("full", type: .scalar(String.self)),
                  GraphQLField("native", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(full: String? = nil, native: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "StaffName", "full": full, "native": native])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The person's full name
              public var full: String? {
                get {
                  return resultMap["full"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "full")
                }
              }

              /// The person's full name in their native language
              public var native: String? {
                get {
                  return resultMap["native"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "native")
                }
              }
            }
          }
        }
      }

      public struct Relation: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pageInfo", type: .object(PageInfo.selections)),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pageInfo: PageInfo? = nil, edges: [Edge?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaConnection", "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
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

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
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

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MediaEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(Int.self)),
              GraphQLField("relationType", arguments: ["version": 2], type: .scalar(MediaRelation.self)),
              GraphQLField("node", type: .object(Node.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int? = nil, relationType: MediaRelation? = nil, node: Node? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaEdge", "id": id, "relationType": relationType, "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the connection
          public var id: Int? {
            get {
              return resultMap["id"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The type of relation to the parent model
          public var relationType: MediaRelation? {
            get {
              return resultMap["relationType"] as? MediaRelation
            }
            set {
              resultMap.updateValue(newValue, forKey: "relationType")
            }
          }

          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Media"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("type", type: .scalar(MediaType.self)),
                GraphQLField("format", type: .scalar(MediaFormat.self)),
                GraphQLField("season", type: .scalar(MediaSeason.self)),
                GraphQLField("status", type: .scalar(MediaStatus.self)),
                GraphQLField("seasonYear", type: .scalar(Int.self)),
                GraphQLField("title", type: .object(Title.selections)),
                GraphQLField("coverImage", type: .object(CoverImage.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, type: MediaType? = nil, format: MediaFormat? = nil, season: MediaSeason? = nil, status: MediaStatus? = nil, seasonYear: Int? = nil, title: Title? = nil, coverImage: CoverImage? = nil) {
              self.init(unsafeResultMap: ["__typename": "Media", "id": id, "type": type, "format": format, "season": season, "status": status, "seasonYear": seasonYear, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }])
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

            /// The type of the media; anime or manga
            public var type: MediaType? {
              get {
                return resultMap["type"] as? MediaType
              }
              set {
                resultMap.updateValue(newValue, forKey: "type")
              }
            }

            /// The format the media was released in
            public var format: MediaFormat? {
              get {
                return resultMap["format"] as? MediaFormat
              }
              set {
                resultMap.updateValue(newValue, forKey: "format")
              }
            }

            /// The season the media was initially released in
            public var season: MediaSeason? {
              get {
                return resultMap["season"] as? MediaSeason
              }
              set {
                resultMap.updateValue(newValue, forKey: "season")
              }
            }

            /// The current releasing status of the media
            public var status: MediaStatus? {
              get {
                return resultMap["status"] as? MediaStatus
              }
              set {
                resultMap.updateValue(newValue, forKey: "status")
              }
            }

            /// The season year the media was initially released in
            public var seasonYear: Int? {
              get {
                return resultMap["seasonYear"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "seasonYear")
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
      }

      public struct Character: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CharacterConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pageInfo", type: .object(PageInfo.selections)),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pageInfo: PageInfo? = nil, edges: [Edge?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "CharacterConnection", "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
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

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PageInfo"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("total", type: .scalar(Int.self)),
              GraphQLField("hasNextPage", type: .scalar(Bool.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(total: Int? = nil, hasNextPage: Bool? = nil) {
            self.init(unsafeResultMap: ["__typename": "PageInfo", "total": total, "hasNextPage": hasNextPage])
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

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["CharacterEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(Int.self)),
              GraphQLField("role", type: .scalar(CharacterRole.self)),
              GraphQLField("node", type: .object(Node.selections)),
              GraphQLField("voiceActors", arguments: ["sort": "LANGUAGE"], type: .list(.object(VoiceActor.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int? = nil, role: CharacterRole? = nil, node: Node? = nil, voiceActors: [VoiceActor?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "CharacterEdge", "id": id, "role": role, "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }, "voiceActors": voiceActors.flatMap { (value: [VoiceActor?]) -> [ResultMap?] in value.map { (value: VoiceActor?) -> ResultMap? in value.flatMap { (value: VoiceActor) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the connection
          public var id: Int? {
            get {
              return resultMap["id"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The characters role in the media
          public var role: CharacterRole? {
            get {
              return resultMap["role"] as? CharacterRole
            }
            set {
              resultMap.updateValue(newValue, forKey: "role")
            }
          }

          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          /// The voice actors of the character
          public var voiceActors: [VoiceActor?]? {
            get {
              return (resultMap["voiceActors"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [VoiceActor?] in value.map { (value: ResultMap?) -> VoiceActor? in value.flatMap { (value: ResultMap) -> VoiceActor in VoiceActor(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [VoiceActor?]) -> [ResultMap?] in value.map { (value: VoiceActor?) -> ResultMap? in value.flatMap { (value: VoiceActor) -> ResultMap in value.resultMap } } }, forKey: "voiceActors")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Character"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("isFavourite", type: .nonNull(.scalar(Bool.self))),
                GraphQLField("image", type: .object(Image.selections)),
                GraphQLField("name", type: .object(Name.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, isFavourite: Bool, image: Image? = nil, name: Name? = nil) {
              self.init(unsafeResultMap: ["__typename": "Character", "id": id, "isFavourite": isFavourite, "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "name": name.flatMap { (value: Name) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The id of the character
            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// If the character is marked as favourite by the currently authenticated user
            public var isFavourite: Bool {
              get {
                return resultMap["isFavourite"]! as! Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "isFavourite")
              }
            }

            /// Character images
            public var image: Image? {
              get {
                return (resultMap["image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "image")
              }
            }

            /// The names of the character
            public var name: Name? {
              get {
                return (resultMap["name"] as? ResultMap).flatMap { Name(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "name")
              }
            }

            public struct Image: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["CharacterImage"]

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
                self.init(unsafeResultMap: ["__typename": "CharacterImage", "large": large])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The character's image of media at its largest size
              public var large: String? {
                get {
                  return resultMap["large"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "large")
                }
              }
            }

            public struct Name: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["CharacterName"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("full", type: .scalar(String.self)),
                  GraphQLField("native", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(full: String? = nil, native: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "CharacterName", "full": full, "native": native])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The character's full name
              public var full: String? {
                get {
                  return resultMap["full"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "full")
                }
              }

              /// The character's full name in their native language
              public var native: String? {
                get {
                  return resultMap["native"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "native")
                }
              }
            }
          }

          public struct VoiceActor: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Staff"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("language", type: .scalar(StaffLanguage.self)),
                GraphQLField("isFavourite", type: .nonNull(.scalar(Bool.self))),
                GraphQLField("image", type: .object(Image.selections)),
                GraphQLField("name", type: .object(Name.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, language: StaffLanguage? = nil, isFavourite: Bool, image: Image? = nil, name: Name? = nil) {
              self.init(unsafeResultMap: ["__typename": "Staff", "id": id, "language": language, "isFavourite": isFavourite, "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }, "name": name.flatMap { (value: Name) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The id of the staff member
            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The primary language of the staff member
            public var language: StaffLanguage? {
              get {
                return resultMap["language"] as? StaffLanguage
              }
              set {
                resultMap.updateValue(newValue, forKey: "language")
              }
            }

            /// If the staff member is marked as favourite by the currently authenticated user
            public var isFavourite: Bool {
              get {
                return resultMap["isFavourite"]! as! Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "isFavourite")
              }
            }

            /// The staff images
            public var image: Image? {
              get {
                return (resultMap["image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "image")
              }
            }

            /// The names of the staff member
            public var name: Name? {
              get {
                return (resultMap["name"] as? ResultMap).flatMap { Name(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "name")
              }
            }

            public struct Image: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["StaffImage"]

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
                self.init(unsafeResultMap: ["__typename": "StaffImage", "large": large])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The person's image of media at its largest size
              public var large: String? {
                get {
                  return resultMap["large"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "large")
                }
              }
            }

            public struct Name: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["StaffName"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("full", type: .scalar(String.self)),
                  GraphQLField("native", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(full: String? = nil, native: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "StaffName", "full": full, "native": native])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The person's full name
              public var full: String? {
                get {
                  return resultMap["full"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "full")
                }
              }

              /// The person's full name in their native language
              public var native: String? {
                get {
                  return resultMap["native"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "native")
                }
              }
            }
          }
        }
      }
    }
  }
}
