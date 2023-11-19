//
//  ServiceContextFactory+FCMPushService.swift
//  FeatherPushDriverFCM
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import AsyncHTTPClient
import FCM
import FeatherService

public extension ServiceContextFactory {

    static func FCMPush(
        client: HTTPClient,
        credentials: FCMCredentials
    ) -> Self {
        .init {
            FCMPushServiceContext(
                client: client,
                credentials: credentials
            )
        }
    }
}
