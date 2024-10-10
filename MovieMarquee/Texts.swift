//
//  Texts.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 09.10.24.
//


enum Texts {

    // MARK: Section Header
    public enum SectionHeader {
        static let mostPopular: String = "Most Popular"
        static let mostRecent: String = "Most Recent"
        static let comingSoon: String = "Coming Soon"
        static let airingToday: String = "Airing Today"
        static let onTheAir: String = "On The Air"
        static let topRated: String = "Top Rated"
    }

    // MARK: NavigationBar Title
    public enum NavigationBarTitle {
        static let discoverScreen: String = "Discover"
        static let genresScreen: String = "Genres"
        static let artistsScreen: String = "Artists"
        static let dashboardScreen: String = "Dashboard"
        static let favoritesScreen: String = "Favorites"
    }

    // MARK: TabBar Item Title
    public enum TabBarItemTitle {
        static let discoverScreen: String = "Discover"
        static let genresScreen: String = "Genres"
        static let artistsScreen: String = "Artists"
        static let favoritesScreen: String = "Favorites"
    }

    // MARK: Button Title
    public enum ButtonTitle {
        static let sliceSeeAll: String = "See All"
        static let artistDetailScreenPhotoAlbums = "Photo Albums"
    }

    // MARK: FavoritesSections
    public enum FavoritesSections {
        static let movies: String = "Movies"
        static let artists = "Artists"
        static let tvSeries = "TV Series"
    }
}
