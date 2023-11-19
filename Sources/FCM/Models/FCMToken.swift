//
//  FCMToken.swift
//  FCM
//
//  Created by Tibor Bodecs on 2023. 01. 16..
//

import Foundation

public struct FCMToken: Codable {

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case scope = "scope"
        case creationTime = "creation_time"
    }

    public let accessToken: String
    public let tokenType: String?
    public let expiresIn: Int?
    public let refreshToken: String?
    public let scope: String?
    public let creationTime: Date?
}
