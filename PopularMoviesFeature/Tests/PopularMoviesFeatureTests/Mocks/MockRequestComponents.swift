//
//  MockRequestComponents.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 10.10.24.
//

@testable import NetworkService
@testable import PopularMoviesFeature

struct MockRequestComponents: @unchecked Sendable, RequestComponents {
    let scheme: String
    let host: String
    let path: String
    let requestType: RequestType
    let headers: [String: String]
    let params: [String: Any]
    let urlParams: [String: String?]
    let addAuthorizationToken: Bool

    static func make(scheme: String = "https",
                     host: String = "api.themoviedb.org",
                     path: String = "/test",
                     requestType: RequestType = .get,
                     headers: [String: String] = [:],
                     params: [String: Any] = [:],
                     urlParams: [String: String?] = [:],
                     addAuthorizationToken: Bool = false) -> Self {
        return MockRequestComponents(scheme: scheme,
                                  host: host,
                                  path: path,
                                  requestType: requestType,
                                  headers: headers,
                                  params: params,
                                  urlParams: urlParams,
                                  addAuthorizationToken: addAuthorizationToken)
    }
}
