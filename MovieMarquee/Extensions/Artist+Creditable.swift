//
//  Artist+Creditable.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 14.10.24.
//

import Models

extension Artist: Creditable {

    func getTitle() -> String {
        return name
    }
    
    func getImagePath() -> String {
        return profilePath ?? ""
    }
}
