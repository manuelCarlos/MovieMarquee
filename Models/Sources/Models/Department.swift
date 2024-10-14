//
//  Department.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

// TODO: - Remove string associated values and add a localizedstring
public enum Department: String, Codable, Hashable, Sendable {
    case acting = "Acting"
    case art = "Art"
    case camera = "Camera"
    case costumeMakeUp = "Costume & Make-Up"
    case crew = "Crew"
    case directing = "Directing"
    case editing = "Editing"
    case production = "Production"
    case sound = "Sound"
    case visualEffects = "Visual Effects"
    case writing = "Writing"
    case lighting = "Lighting"
    case creator = "Creator"
    case actor = "Actors"
}
