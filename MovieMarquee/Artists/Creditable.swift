//
//  Creditable.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 14.10.24.
//

import NetworkService
import Models

protocol Creditable: Codable {
    var id: Int { get }
    func getTitle() -> String
    func getImagePath() -> String
    func getPosterUrl() -> String
}

extension Creditable {

    func getPosterUrl() -> String {
        return APIConstants.defaultScheme + APIConstants.baseImgUrl + APIConstants.baseImgUrlPath + getImagePath()
    }
}
