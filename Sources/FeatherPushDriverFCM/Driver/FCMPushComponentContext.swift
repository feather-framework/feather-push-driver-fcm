//
//  FCMPushComponentContext.swift
//  FeatherPushDriverFCM
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import FCM
import AsyncHTTPClient
import FeatherComponent

/// fcm push component context
public struct FCMPushComponentContext: ComponentContext {

    let client: HTTPClient
    let credentials: FCMCredentials

    /// fcm push component init
    public init(client: HTTPClient, credentials: FCMCredentials) {
        self.client = client
        self.credentials = credentials
    }

    /// fcm push component make
    public func make() throws -> ComponentFactory {
        FCMPushComponentFactory()
    }
}
