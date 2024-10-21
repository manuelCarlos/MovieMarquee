//
//  Texts.swift
//  NetworkService
//
//  Created by Manuel Lopes on 04.10.24.
//

import Foundation

/// Note that: SPM generates the resource_bundle_accessor `Bundle.module` only if the corresponding target contains resources.
/// The Resources folder MUST contain something and MUST NOT be an empty directory.
/// Further more, to have the compiler automatically add the localization keys to the string catalog:
/// 1.  the package manifest Has to include the `defaultLocalization: "en"` parameter
/// 2. Xcode build setting for the app target needs to have `Use Compiler to Extract  Swift strings` turned on.
enum Texts {

    static let networkErrorDescription = NSLocalizedString("network_error_description_key",
                                                           bundle: .module,
                                                           value: "Cannot Fetch Popular Movies",
                                                           comment: "Error description when it's not possible to fetch Popular Movies")

    static let networkErrorRecoverySuggestion = NSLocalizedString("network_error_recovery_suggestion_key",
                                                                  bundle: .module,
                                                                  value: "Due to a network or server issue, we couldn't fetch the data. Please try again later.",
                                                                  comment: "Error description when it's not possible to fetch Popular Movies and recovery suggestion")

    static let invalidServerResponseTitle = NSLocalizedString("network_invalid_server_response_title_key",
                                                              bundle: .module,
                                                              value: "The server returned an invalid response.",
                                                              comment: "Error title when the server returned an invalid response")

    static let invalidURLTitle = NSLocalizedString("network_invalid_url_title_key",
                                                   bundle: .module,
                                                   value: "URL string is malformed.",
                                                   comment: "Error title when the url is invalid")
}
