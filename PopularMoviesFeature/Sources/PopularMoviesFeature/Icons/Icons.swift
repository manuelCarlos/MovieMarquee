//
//  Icons.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 10.10.24.
//

import SwiftUI

@available(iOS 13.0, *)
enum Icons {

    static func favorite(isOn: Bool) -> Image {
        isOn ? Image(systemName: "heart.fill") : Image(systemName: "heart")
    }

    static let disclosureIndicator = Image(systemName: "chevron.right")

    static let moviePosterFailure = Image(systemName: "photo.badge.exclamationmark")

    static let artistItemFailure =  Image(systemName: "person.fill")
}
