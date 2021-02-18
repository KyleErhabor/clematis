//
//  GraphQLCustomScalars.swift
//  Clematis
//
//  Created by Kyle Erhabor on 12/11/20.
//

import Apollo

public typealias CountryCode = String

public enum Json {
    case array([Any?])
    case dictionary([String: Any?])
}

extension Json: JSONDecodable {
    public init(jsonValue value: JSONValue) throws {
        if let arr = value as? Array<Any?> {
            self = .array(arr)
        } else if let dict = value as? Dictionary<String, Any?> {
            self = .dictionary(dict)
        } else {
            throw JSONDecodingError.couldNotConvert(value: value, to: Json.self)
        }
    }
}
