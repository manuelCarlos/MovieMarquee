//
//  MockMovies.swift
//  NetworkServiceTests
//
//  Created by Manuel Lopes on 12.10.24.
//

struct MockMovies: Decodable {
    let page: Int?
    let results: [MockMovie]?
    let totalResults: Int?
    let totalPages: Int?
}
