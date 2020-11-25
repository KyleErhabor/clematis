//
//  ApolloNetwork.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 9/4/20.
//

import SwiftUI
import Apollo

class ApolloNetwork {
    static let shared = ApolloNetwork()

    private(set) lazy var anilist = ApolloClient(networkTransport: networkTransport)

    private lazy var networkTransport: HTTPNetworkTransport = {
        let transport = HTTPNetworkTransport(url: URL(string: "https://graphql.anilist.co/")!)
        transport.delegate = self

        return transport
    }()
}

extension ApolloNetwork: HTTPNetworkTransportPreflightDelegate {
    func networkTransport(_ networkTransport: HTTPNetworkTransport, shouldSend request: URLRequest) -> Bool {
        return true
    }

    func networkTransport(_ networkTransport: HTTPNetworkTransport, willSend request: inout URLRequest) {
        if let token = UserDefaults.standard.string(forKey: SettingsKeys.accessToken) {
            var headers = request.allHTTPHeaderFields ?? [String: String]()

            headers["Authorization"] = "Bearer \(token)"
            request.allHTTPHeaderFields = headers
        }
    }
}
