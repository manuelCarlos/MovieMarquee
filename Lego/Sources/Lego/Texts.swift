//
//  File.swift
//  Lego
//
//  Created by Manuel Lopes on 21.10.24.
//

import Foundation

enum Texts {

    enum FailedState {

        static let retry = NSLocalizedString("lego_failed_state_retry_key",
                                             bundle: .module,
                                             value: "Retry",
                                             comment: "Text on retry button of failed state view")
    }
}
