//
//  ResponseValidationInterceptor.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/17/21.
//

import Apollo
import Foundation

class ResponseValidationInterceptor: ApolloInterceptor {
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        if response?.parsedResponse?.errors?.contains(where: { $0.message == "Invalid token" }) == true {
            // Tokens are long-lived, so they shouldn't expire unless the user has revoked access.
            //
            // It would be nice to call `CurrentUser.removeUser(:)`, but instances of the class only live in views.
            // Instead, we'll remove it from the UserDefaults settings.
            UserDefaults.standard.set(nil, forKey: SettingsKeys.accessTokens)
            chain.retry(request: request, completion: completion)

            return
        }

        chain.proceedAsync(request: request, response: response, completion: completion)
    }
}
