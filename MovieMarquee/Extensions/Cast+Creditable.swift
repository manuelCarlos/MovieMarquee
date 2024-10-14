//
//  File.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 14.10.24.
//


extension Cast: Creditable {

    func getTitle() -> String { return title ?? originalTitle ?? originalName ?? "" }

    func getImagePath() -> String { return posterPath ?? profilePath ?? "" }

    func getRole() -> String { return character ?? job ?? department?.rawValue ?? "" }

}