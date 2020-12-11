// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// Types that can be liked
public enum LikeableType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case thread
  case threadComment
  case activity
  case activityReply
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "THREAD": self = .thread
      case "THREAD_COMMENT": self = .threadComment
      case "ACTIVITY": self = .activity
      case "ACTIVITY_REPLY": self = .activityReply
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .thread: return "THREAD"
      case .threadComment: return "THREAD_COMMENT"
      case .activity: return "ACTIVITY"
      case .activityReply: return "ACTIVITY_REPLY"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: LikeableType, rhs: LikeableType) -> Bool {
    switch (lhs, rhs) {
      case (.thread, .thread): return true
      case (.threadComment, .threadComment): return true
      case (.activity, .activity): return true
      case (.activityReply, .activityReply): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [LikeableType] {
    return [
      .thread,
      .threadComment,
      .activity,
      .activityReply,
    ]
  }
}
