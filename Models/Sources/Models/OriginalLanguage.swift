//
//  OriginalLanguage.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

import Foundation

public typealias OriginalLanguage = String

extension OriginalLanguage {

    public var localizedString: String? {
        return Locale.current.localizedString(forIdentifier: self)
    }
}
