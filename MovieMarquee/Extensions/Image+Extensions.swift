//
//  Image+Extensions.swift
//  MovieMarquee
//
//  Created by Manuel Lopes on 12.10.24.
//

import SwiftUI

extension Image {

    init(resource name: String, ofType type: String) {
        if let path = Bundle.main.path(forResource: name, ofType: type),
           let image = UIImage(contentsOfFile: path) {
            self.init(uiImage: image)
        } else {
            self.init(systemName: "exclamationmark.triangle")
            assertionFailure("Couldn't find image named \(name).")
        }
    }
}
