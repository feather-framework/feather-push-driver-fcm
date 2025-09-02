//
//  FCMJWTPayload.swift
//  FCM
//
//  Created by Tibor Bodecs on 2023. 01. 16..
//

import JWTKit

/// fcm jwt payload
struct FCMJWTPayload: JWTPayload {

    var iss: IssuerClaim
    var aud: AudienceClaim
    let scope: String
    var iat: IssuedAtClaim
    var exp: ExpirationClaim

    /// verify
    public func verify(using algorithm: some JWTAlgorithm)
        async throws
    {
        try self.exp.verifyNotExpired()
    }
}
