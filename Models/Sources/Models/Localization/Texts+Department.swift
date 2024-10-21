//
//  File.swift
//  Models
//
//  Created by Manuel Lopes on 20.10.24.
//

import Foundation

extension Texts {

    enum Department {

        static let acting = NSLocalizedString("department_acting_key",
                                              bundle: .module,
                                              value: "Acting",
                                              comment: "Active department")

        static let art = NSLocalizedString("department_art_key",
                                           bundle: .module,
                                           value: "Art",
                                           comment: "Art department")

        static let camera = NSLocalizedString("department_camera_key",
                                              bundle: .module,
                                              value: "Camera",
                                              comment: "Camera department")

        static let costumeAndMakeup = NSLocalizedString("department_costume_and_makeup_key",
                                                        bundle: .module,
                                                        value: "Costume & Make-Up",
                                                        comment: "Costume & Make-Up department")

        static let crew = NSLocalizedString("department_crew_key",
                                            bundle: .module,
                                            value: "Crew",
                                            comment: "Crew department")

        static let directing = NSLocalizedString("department_directing_key",
                                                 bundle: .module,
                                                 value: "Directing",
                                                 comment: "Directing department")

        static let editing = NSLocalizedString("department_editing_key",
                                               bundle: .module,
                                               value: "Editing",
                                               comment: "Editing department")

        static let production = NSLocalizedString("department_production_key",
                                                  bundle: .module,
                                                  value: "Production",
                                                  comment: "Production department")

        static let sound = NSLocalizedString("department_sound_key",
                                             bundle: .module,
                                             value: "Sound",
                                             comment: "Sound department")

        static let visualEffects = NSLocalizedString("department_visual_effects_key",
                                                     bundle: .module,
                                                     value: "Visual Effects",
                                                     comment: "Visual Effects department")

        static let writing = NSLocalizedString("department_writing_key",
                                               bundle: .module,
                                               value: "Writing",
                                               comment: "Writing department")

        static let lighting = NSLocalizedString("department_lighting_key",
                                                bundle: .module,
                                                value: "Lighting",
                                                comment: "Lighting department")

        static let creator = NSLocalizedString("department_creator_key",
                                               bundle: .module,
                                               value: "Creator",
                                               comment: "Creator department")

        static let actor = NSLocalizedString("department_actor_key",
                                             bundle: .module,
                                             value: "Actors",
                                             comment: "Actor department")
    }
}
