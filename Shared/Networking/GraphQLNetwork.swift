//
//  GraphQLNetwork.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 9/4/20.
//

import SwiftUI
import Apollo

class GraphQLNetwork {
    static let shared = GraphQLNetwork()

    let anilist: ApolloClient = {
        let store = ApolloStore()

        return ApolloClient(networkTransport: RequestChainNetworkTransport(
            interceptorProvider: GraphQLNetworkInterceptorProvider(
                store: store,
                client: URLSessionClient()
            ),
            endpointURL: URL(string: "https://graphql.anilist.co/")!
        ), store: store)
    }()
}

fileprivate struct GraphQLNetworkInterceptorProvider {
    private(set) var store: ApolloStore
    private(set) var client: URLSessionClient
}

extension GraphQLNetworkInterceptorProvider: InterceptorProvider {
    func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        return [
            MaxRetryInterceptor(maxRetriesAllowed: 1),
            LegacyCacheReadInterceptor(store: store),
            AuthorizationHeaderAddingInterceptor(),
            NetworkFetchInterceptor(client: client),
            ResponseCodeInterceptor(),
            LegacyParsingInterceptor(cacheKeyForObject: store.cacheKeyForObject),
            AutomaticPersistedQueryInterceptor(),
            LegacyCacheWriteInterceptor(store: store),
        ]
    }
}

fileprivate class AuthorizationHeaderAddingInterceptor: ApolloInterceptor {
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        if let token = UserDefaults.standard.string(forKey: SettingsKeys.accessToken) {
            request.addHeader(name: "Authorization", value: "Bearer \(token)")
        }

        chain.proceedAsync(request: request, response: response, completion: completion)
    }
}
