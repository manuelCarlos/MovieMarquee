//
//  MediaListFetchStrategy.swift
//  NetworkService
//
//  Created by Manuel Lopes on 09.10.24.
//

import Foundation

protocol MediaListFetcher {
    func fetch(page: Int) -> NetworkRequest
}