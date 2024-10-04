//
//  Texts.swift
//  NetworkService
//
//  Created by Manuel Lopes on 04.10.24.
//

import Foundation

// Note that: SPM generates the resource_bundle_accessor `Bundle.module` only if the corresponding target contains resources.
// The Resources folder MUST contain something and MUST NOT be an empty directory.

enum Texts {
    
    static let networkErrorDescription = NSLocalizedString("network_error_description_key",
                                                           bundle: .module,
                                                           value: "Cannot Fetch Popular Movies",
                                                           comment: "Error description when it's not possible to fetch Popular Movies")
}
