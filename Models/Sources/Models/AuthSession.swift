//
//  AuthSession.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

struct AuthSession: Codable {
    let success: Bool
    let sessionID: String

    enum CodingKeys: String, CodingKey {
        case success
        case sessionID = "session_id"
    }
}
