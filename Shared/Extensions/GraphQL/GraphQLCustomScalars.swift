//
//  GraphQLCustomScalars.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 12/11/20.
//

import Apollo

public typealias CountryCode = String

public enum Json {
    case array([Any])
    case dictionary([String: Any?])

    func get() -> [Any]? {
        if case let .array(arr) = self {
            return arr
        }

        return nil
    }

    func get() -> [String: Any?]? {
        if case let .dictionary(dict) = self {
            return dict
        }

        return nil
    }

    mutating func replace(at index: Int, with element: Any) {
        if case var .array(arr) = self {
            arr[index] = element

            self = .array(arr)
        }
    }

    mutating func replace(with elements: [Any]) {
        if case .array = self {
            self = .array(elements)
        }
    }

    mutating func replace(key: String, with value: Any) {
        if case var .dictionary(dict) = self {
            dict[key] = value

            self = .dictionary(dict)
        }
    }

    mutating func replace(with dict: [String: Any]) {
        if case .dictionary = self {
            self = .dictionary(dict)
        }
    }
}

extension Json: JSONDecodable {
    public init(jsonValue value: JSONValue) throws {
        if let arr = value as? Array<Any> {
            self = .array(arr)
        } else if let dict = value as? Dictionary<String, Any> {
            self = .dictionary(dict)
        } else {
            throw JSONDecodingError.couldNotConvert(value: value, to: Json.self)
        }
    }
}
