//
//  Creditable.swift
//  Models
//
//  Created by Manuel Lopes on 18.10.24.
//

import TMDBData

@available(iOS 13.0, *)
public protocol Creditable: Codable, Sendable {
    var id: Int { get }
    var titleString: String? { get }
    var imagePath: String? { get }
    var posterUrl: String? { get }
}

@available(iOS 13.0, *)
public extension Creditable {

    var posterUrl: String? {
        guard let imagePath else {
            return nil
        }
        return APIConstants.defaultScheme + APIConstants.baseImgUrl + APIConstants.baseImgUrlPath + imagePath
    }
}
