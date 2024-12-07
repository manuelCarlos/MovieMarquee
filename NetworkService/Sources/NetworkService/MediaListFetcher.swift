//
//  MediaListFetchStrategy.swift
//  NetworkService
//
//  Created by Manuel Lopes on 09.10.24.
//

import Foundation

public protocol MediaListFetcher {
    func fetchRequestComponents(page: Int) -> RequestComponents
}
