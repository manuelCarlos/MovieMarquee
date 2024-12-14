//
//  File.swift
//  FavoriteMoviesFeature
//
//  Created by Manuel Lopes on 21.10.24.
//

import Foundation

enum Texts {

    static let favoriteMovies = NSLocalizedString(
        "favorite_movies_feature_navigation_bar_title_key",
        bundle: .module,
        value: "Favorite Movies",
        comment: "Title of the navigation bar for the favorite movies feature"
    )

    static let noFavoriteMoviesTitle = NSLocalizedString(
        "favorite_movies_feature_no_favorite_movies_title_key",
        bundle: .module,
        value: "No Favorite movies for now",
        comment: "Title of the empty state when there are no favorite movies"
    )

    static let noFavoriteMoviesDescription = NSLocalizedString(
        "favorite_movies_feature_no_favorite_movies_description_key",
        bundle: .module,
        value: "Favorite some movies to see them here",
        comment: "Description of the empty state when there are no favorite movies"
    )
}
