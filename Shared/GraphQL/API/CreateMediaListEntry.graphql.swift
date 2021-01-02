// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class CreateMediaListEntryMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateMediaListEntry($mediaId: Int, $status: MediaListStatus, $score: Float, $progress: Int, $progressVolumes: Int, $repeat: Int, $priority: Int, $private: Boolean, $notes: String, $hiddenFromStatusLists: Boolean, $customLists: [String], $advancedScores: [Float], $startedAt: FuzzyDateInput, $completedAt: FuzzyDateInput) {
      SaveMediaListEntry(
        mediaId: $mediaId
        status: $status
        score: $score
        progress: $progress
        progressVolumes: $progressVolumes
        repeat: $repeat
        priority: $priority
        private: $private
        notes: $notes
        hiddenFromStatusLists: $hiddenFromStatusLists
        customLists: $customLists
        advancedScores: $advancedScores
        startedAt: $startedAt
        completedAt: $completedAt
      ) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "CreateMediaListEntry"

  public var mediaId: Int?
  public var status: MediaListStatus?
  public var score: Double?
  public var progress: Int?
  public var progressVolumes: Int?
  public var `repeat`: Int?
  public var priority: Int?
  public var `private`: Bool?
  public var notes: String?
  public var hiddenFromStatusLists: Bool?
  public var customLists: [String?]?
  public var advancedScores: [Double?]?
  public var startedAt: FuzzyDateInput?
  public var completedAt: FuzzyDateInput?

  public init(mediaId: Int? = nil, status: MediaListStatus? = nil, score: Double? = nil, progress: Int? = nil, progressVolumes: Int? = nil, `repeat`: Int? = nil, priority: Int? = nil, `private`: Bool? = nil, notes: String? = nil, hiddenFromStatusLists: Bool? = nil, customLists: [String?]? = nil, advancedScores: [Double?]? = nil, startedAt: FuzzyDateInput? = nil, completedAt: FuzzyDateInput? = nil) {
    self.mediaId = mediaId
    self.status = status
    self.score = score
    self.progress = progress
    self.progressVolumes = progressVolumes
    self.`repeat` = `repeat`
    self.priority = priority
    self.`private` = `private`
    self.notes = notes
    self.hiddenFromStatusLists = hiddenFromStatusLists
    self.customLists = customLists
    self.advancedScores = advancedScores
    self.startedAt = startedAt
    self.completedAt = completedAt
  }

  public var variables: GraphQLMap? {
    return ["mediaId": mediaId, "status": status, "score": score, "progress": progress, "progressVolumes": progressVolumes, "repeat": `repeat`, "priority": priority, "private": `private`, "notes": notes, "hiddenFromStatusLists": hiddenFromStatusLists, "customLists": customLists, "advancedScores": advancedScores, "startedAt": startedAt, "completedAt": completedAt]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("SaveMediaListEntry", arguments: ["mediaId": GraphQLVariable("mediaId"), "status": GraphQLVariable("status"), "score": GraphQLVariable("score"), "progress": GraphQLVariable("progress"), "progressVolumes": GraphQLVariable("progressVolumes"), "repeat": GraphQLVariable("repeat"), "priority": GraphQLVariable("priority"), "private": GraphQLVariable("private"), "notes": GraphQLVariable("notes"), "hiddenFromStatusLists": GraphQLVariable("hiddenFromStatusLists"), "customLists": GraphQLVariable("customLists"), "advancedScores": GraphQLVariable("advancedScores"), "startedAt": GraphQLVariable("startedAt"), "completedAt": GraphQLVariable("completedAt")], type: .object(SaveMediaListEntry.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(saveMediaListEntry: SaveMediaListEntry? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "SaveMediaListEntry": saveMediaListEntry.flatMap { (value: SaveMediaListEntry) -> ResultMap in value.resultMap }])
    }

    /// Create or update a media list entry
    public var saveMediaListEntry: SaveMediaListEntry? {
      get {
        return (resultMap["SaveMediaListEntry"] as? ResultMap).flatMap { SaveMediaListEntry(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "SaveMediaListEntry")
      }
    }

    public struct SaveMediaListEntry: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MediaList"]

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
        self.init(unsafeResultMap: ["__typename": "MediaList", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the list entry
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
