//
//  FCMPushComponentContext.swift
//  FeatherPushDriverFCM
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import FCM
import AsyncHTTPClient
import FeatherComponent

public struct FCMPushComponentContext: ComponentContext {

    let client: HTTPClient
    let credentials: FCMCredentials

    public init(client: HTTPClient, credentials: FCMCredentials) {
        self.client = client
        self.credentials = credentials
    }

    public func make() throws -> ComponentBuilder {
        FCMPushComponentBuilder()
    }
}
