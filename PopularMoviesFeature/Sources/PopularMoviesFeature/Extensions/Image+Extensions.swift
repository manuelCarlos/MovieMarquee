//
//  Image+Extensions.swift
//  PopularMoviesFeature
//
//  Created by Manuel Lopes on 12.10.24.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
extension Image {

    init(resource name: String, ofType type: String, in bundle: Bundle = .main) {
        if let path = bundle.path(forResource: name, ofType: type),
           let image = UIImage(contentsOfFile: path) {
            self.init(uiImage: image)
        } else {
            self.init(systemName: "exclamationmark.triangle")
        }
    }
}
