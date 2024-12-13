//
//  DurationFormatter.swift
//  Models
//
//  Created by Manuel Lopes on 13.12.24.
//

import Foundation

let durationFormatter: DateComponentsFormatter = {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.day, .hour, .minute]
    formatter.unitsStyle = .short
    return formatter
}()
