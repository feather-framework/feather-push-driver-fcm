//
//  FCMToken.swift
//  FCM
//
//  Created by Tibor Bodecs on 2023. 01. 16..
//

import Foundation

/// fcm token
public struct FCMToken: Codable {

    enum CodingKeys: String, CodingKey {
        /// access token
        case accessToken = "access_token"
        /// token type
        case tokenType = "token_type"
        /// expire date
        case expiresIn = "expires_in"
        /// refresh token
        case refreshToken = "refresh_token"
        /// scope
        case scope = "scope"
        /// creation date
        case creationTime = "creation_time"
    }

    /// access token
    public let accessToken: String
    /// token type
    public let tokenType: String?
    /// expire date
    public let expiresIn: Int?
    /// refresh token
    public let refreshToken: String?
    /// scope
    public let scope: String?
    /// creation date
    public let creationTime: Date?
}
