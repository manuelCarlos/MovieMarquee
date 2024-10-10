//
//  Icons.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 10.10.24.
//


enum Icons: String, RawRepresentable {
    case favoriteOn = "heart.fill"
    case favoriteOff = "heart"

    case posterBackdrop = "film"

    case artistImageBackdrop = "person.fill"

    public enum TabBar: String {
        case discover = "square.grid.2x2.fill"
        case artist = "person.crop.circle"
        case favorites = "star.circle.fill"
    }

    case seeAllButton = "chevron.right"
}
