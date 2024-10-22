//
//  Texts.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 22.10.24.
//

import Foundation

enum Texts {

    enum TabBarItemTitle {

        static let discoverTabTitle: String = NSLocalizedString("movie_marquee_tab_bar_item_discover_screen_title",
                                                                bundle: .main,
                                                                value: "Discover",
                                                                comment: "Title for the Discover screen tab in the tab bar")

        static let favoritesTabTitle: String = NSLocalizedString("movie_marquee_tab_bar_item_favorites_screen_title",
                                                                 bundle: .main,
                                                                 value: "Favorites",
                                                                 comment: "Title for the Favorites screen tab in the tab bar")
    }
}
