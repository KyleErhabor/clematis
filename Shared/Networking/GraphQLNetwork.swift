//
//  GraphQLNetwork.swift
//  Clematis
//
//  Created by Kyle Erhabor on 9/4/20.
//

import Apollo
import Foundation

class GraphQLNetwork {
    static let shared: ApolloClient = {
        let store = ApolloStore()

        return ApolloClient(networkTransport: RequestChainNetworkTransport(
            interceptorProvider: GraphQLNetworkInterceptorProvider(
                store: store,
                client: URLSessionClient()
            ),
            endpointURL: URL(string: "https://graphql.anilist.co/")!,
            requestBodyCreator: NilAwareRequestBodyCreator()
        ), store: store)
    }()
}

fileprivate struct GraphQLNetworkInterceptorProvider {
    private let store: ApolloStore
    private let client: URLSessionClient

    init(store: ApolloStore, client: URLSessionClient) {
        self.store = store
        self.client = client
    }
}

extension GraphQLNetworkInterceptorProvider: InterceptorProvider {
    func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        return [
            MaxRetryInterceptor(maxRetriesAllowed: 1),
            AuthorizationHeaderAddingInterceptor(),
            NetworkFetchInterceptor(client: client),
            LegacyParsingInterceptor(cacheKeyForObject: store.cacheKeyForObject),
            ResponseValidationInterceptor(),
            AutomaticPersistedQueryInterceptor(),
            LegacyCacheWriteInterceptor(store: store)
        ]
    }
}
