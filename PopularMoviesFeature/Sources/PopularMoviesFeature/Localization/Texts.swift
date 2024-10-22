//
//  Texts.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 09.10.24.
//

import Foundation

enum Texts {

    static let popularMoviesFeatureViewTitle = NSLocalizedString("popular_movies_feature_view_title_key",
                                                                 bundle: .module,
                                                                 value: "Most Popular",
                                                                 comment: "Title for the popular movies feature view")

    static let popularMoviesFeatureNavigationTitle = NSLocalizedString("popular_movies_feature_navigation_title_key",
                                                                       bundle: .module,
                                                                       value: "All Popular Movies",
                                                                       comment: "Navigation title for the popular movies feature")

    static let popularMoviesFeatureNavigationBarTitle = NSLocalizedString("popular_movies_feature_navigation_bar_title_key",
                                                                          bundle: .module,
                                                                          value: "Discover",
                                                                          comment: "Navigation bar title for the popular movies feature")

    static let seeAll = NSLocalizedString("popular_movies_feature_view_see_all_key",
                                          bundle: .module,
                                          value: "See All",
                                          comment: "Button title to see all items")

    static let loading = NSLocalizedString("loading_title_key",
                                           bundle: .module,
                                           value: "Loading...",
                                           comment: "Text indicating loading state")

    static let somethingWentWrong = NSLocalizedString("something_went_wrong_key",
                                                      bundle: .module,
                                                      value: "Oops, something went wrong",
                                                      comment: "Error message indicating something went wrong")

    static let movieOverviewTitle = NSLocalizedString("movie_overview_title_key",
                                                      bundle: .module,
                                                      value: "Overview",
                                                      comment: "Title for the movie overview section")

    static let movieCastTitle = NSLocalizedString("movie_cast_title_key",
                                                  bundle: .module,
                                                  value: "Cast",
                                                  comment: "Title for the movie cast section")

    static let unavailable = NSLocalizedString("unavailable_key",
                                               bundle: .module,
                                               value: "Unavailable",
                                               comment: "Text indicating something is unavailable")
}
