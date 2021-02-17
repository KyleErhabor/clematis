//
//  NilAwareRequestBodyCreator.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/17/21.
//

import Apollo
import Foundation

struct NilAwareRequestBodyCreator: RequestBodyCreator {
    func requestBody<Operation: GraphQLOperation>(
        for operation: Operation,
        sendOperationIdentifiers: Bool,
        sendQueryDocument: Bool,
        autoPersistQuery: Bool
    ) -> GraphQLMap {
        var body: GraphQLMap = [
            "variables": operation.variables?.withNilValuesRemoved,
            "operationName": operation.operationName,
        ]

        if sendOperationIdentifiers {
            guard let operationIdentifier = operation.operationIdentifier else {
                preconditionFailure("To send operation identifiers, Apollo types must be generated with"
                                    + " operationIdentifiers")
            }

            body["id"] = operationIdentifier
        }

        if sendQueryDocument {
            body["query"] = operation.queryDocument
        }

        if autoPersistQuery {
            guard let operationIdentifier = operation.operationIdentifier else {
                preconditionFailure("To enable `autoPersistQueries`, Apollo types must be generated with operationIdentifiers")
            }

            body["extensions"] = [
                "persistedQuery": [
                    "sha256Hash": operationIdentifier,
                    "version": 1
                ]
            ]
        }

        return body
    }
}
