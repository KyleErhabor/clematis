//
//  AuthorizationHeaderAddingInterceptor.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/17/21.
//

import Apollo
import Foundation

class AuthorizationHeaderAddingInterceptor: ApolloInterceptor {
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        if let tokens = UserDefaults.standard.stringArray(forKey: SettingsKeys.accessTokens), !tokens.isEmpty {
            let accountIndex = UserDefaults.standard.integer(forKey: SettingsKeys.accountIndex)

            request.addHeader(name: "Authorization", value: "Bearer \(tokens[accountIndex])")
        }

        chain.proceedAsync(request: request, response: response, completion: completion)
    }
}
