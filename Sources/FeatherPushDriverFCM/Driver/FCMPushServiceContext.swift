//
//  FCMPushServiceContext.swift
//  FeatherPushDriverFCM
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import FCM
import AsyncHTTPClient
import FeatherService

public struct FCMPushServiceContext: ServiceContext {

    let client: HTTPClient
    let credentials: FCMCredentials
    
    public init(client: HTTPClient, credentials: FCMCredentials) {
        self.client = client
        self.credentials = credentials
    }

    public func createDriver() throws -> ServiceDriver {
        FCMPushServiceDriver()
    }
}
