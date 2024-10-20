//
//  Department.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

import Foundation

/// Enum representing different departments in a movie production.
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

    /// Returns a localized string for each department.
    public var localizedString: String {
        switch self {
        case .acting:
            return Texts.Department.acting
        case .art:
            return Texts.Department.art
        case .camera:
            return Texts.Department.camera
        case .costumeMakeUp:
            return Texts.Department.costumeAndMakeup
        case .crew:
            return Texts.Department.crew
        case .directing:
            return Texts.Department.directing
        case .editing:
            return Texts.Department.editing
        case .production:
            return Texts.Department.production
        case .sound:
            return Texts.Department.sound
        case .visualEffects:
            return Texts.Department.visualEffects
        case .writing:
            return Texts.Department.writing
        case .lighting:
            return Texts.Department.lighting
        case .creator:
            return Texts.Department.creator
        case .actor:
            return Texts.Department.actor
        }
    }
}
