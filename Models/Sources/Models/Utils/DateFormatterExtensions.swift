//
//  DateFormatterExtensions.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

import Foundation

let dateOfReleaseFormatter = DateFormatter.yyyyMMdd

fileprivate extension DateFormatter {
    static let yyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = .current
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
