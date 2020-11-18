//
//  ApolloNetwork.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 9/4/20.
//

import SwiftUI
import Apollo

class ApolloNetwork: HTTPNetworkTransportPreflightDelegate {
    @AppStorage(SettingsKeys.accessToken) private var accessToken: String?

    static let shared = ApolloNetwork()

    private(set) lazy var anilist = ApolloClient(networkTransport: networkTransport)

    enum ALMetadata {
        static var authURL: URL {
            var components = URLComponents(string: "https://anilist.co/api/v2/oauth/authorize")!
            components.queryItems = [
                URLQueryItem(name: "client_id", value: "1652"),
                URLQueryItem(name: "response_type", value: "token")
            ]

            return components.url!
        }
    }

    private lazy var networkTransport: HTTPNetworkTransport = {
        let transport = HTTPNetworkTransport(url: URL(string: "https://graphql.anilist.co/")!)
        transport.delegate = self

        return transport
    }()

    func networkTransport(_ networkTransport: HTTPNetworkTransport, shouldSend request: URLRequest) -> Bool {
        return true
    }

    func networkTransport(_ networkTransport: HTTPNetworkTransport, willSend request: inout URLRequest) {
        if let token = accessToken {
            var headers = request.allHTTPHeaderFields ?? [String: String]()

            headers["Authorization"] = "Bearer \(token)"
            request.allHTTPHeaderFields = headers
        }
    }
}
