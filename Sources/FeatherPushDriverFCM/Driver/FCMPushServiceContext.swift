//
//  FCMPushServiceContext.swift
//  FeatherPushDriverFCM
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import FCM
import AsyncHTTPClient
import FeatherService

struct FCMPushServiceContext: ServiceContext {

    let client: HTTPClient
    let credentials: FCMCredentials

    func createDriver() throws -> ServiceDriver {
        FCMPushServiceDriver()
    }

}
