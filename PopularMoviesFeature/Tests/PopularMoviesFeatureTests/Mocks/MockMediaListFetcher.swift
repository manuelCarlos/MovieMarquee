//
//  MockMediaListFetcher.swift
//  PopularMoviesFeatureTests
//
//  Created by Manuel Lopes on 10.10.24.
//

@testable import NetworkService
@testable import PopularMoviesFeature

final class MockMediaListFetcher: MediaListFetcher {

    func fetchRequestComponents(page: Int) -> NetworkService.RequestComponents {
        return MockRequestComponents.make()
    }
}
