// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class MarkdownParseQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query MarkdownParse($markdown: String!) {
      Markdown(markdown: $markdown) {
        __typename
        html
      }
    }
    """

  public let operationName: String = "MarkdownParse"

  public var markdown: String

  public init(markdown: String) {
    self.markdown = markdown
  }

  public var variables: GraphQLMap? {
    return ["markdown": markdown]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Markdown", arguments: ["markdown": GraphQLVariable("markdown")], type: .object(Markdown.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(markdown: Markdown? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Markdown": markdown.flatMap { (value: Markdown) -> ResultMap in value.resultMap }])
    }

    /// Provide AniList markdown to be converted to html (Requires auth)
    public var markdown: Markdown? {
      get {
        return (resultMap["Markdown"] as? ResultMap).flatMap { Markdown(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Markdown")
      }
    }

    public struct Markdown: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ParsedMarkdown"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("html", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(html: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ParsedMarkdown", "html": html])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The parsed markdown as html
      public var html: String? {
        get {
          return resultMap["html"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "html")
        }
      }
    }
  }
}
