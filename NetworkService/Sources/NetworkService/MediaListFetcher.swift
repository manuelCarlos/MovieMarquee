//
//  MediaListFetcher.swift
//  NetworkService
//
//  Created by Manuel Lopes on 09.10.24.
//

import Foundation

/// A protocol for creating `RequestComponents` to fetch paginated media lists.
///
/// Conformers of `MediaListFetcher` are responsible for providing the necessary
/// request details for fetching media data, such as movies, TV shows, or other content.
public protocol MediaListFetcher {

    /// Generates the `RequestComponents` needed to fetch a specific page of media data.
    ///
    /// - Parameter page: The page number to fetch. Typically corresponds to a paginated
    ///   API's `page` parameter.
    /// - Returns: A `RequestComponents` instance containing the details of the network request
    ///   for the specified page. ```
    func fetchRequestComponents(page: Int) -> RequestComponents
}
