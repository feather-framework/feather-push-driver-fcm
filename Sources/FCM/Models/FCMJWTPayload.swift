//
//  FCMJWTPayload.swift
//  FCM
//
//  Created by Tibor Bodecs on 2023. 01. 16..
//

import JWTKit

struct FCMJWTPayload: JWTPayload {

    var iss: IssuerClaim
    var aud: AudienceClaim
    let scope: String
    var iat: IssuedAtClaim
    var exp: ExpirationClaim

    func verify(using signer: JWTSigner) throws {
        try self.exp.verifyNotExpired()
    }
}
