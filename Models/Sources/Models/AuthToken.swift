//
//  AuthToken.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

struct AuthToken: Codable {
    let success: Bool
    let expiresAt, requestToken: String

    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}
