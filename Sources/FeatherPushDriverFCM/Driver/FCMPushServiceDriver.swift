//
//  FCMPushServiceDriver.swift
//  FeatherPushDriverFCM
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import FeatherService

struct FCMPushServiceDriver: ServiceDriver {

    func run(using config: ServiceConfig) throws -> Service {
        FCMPushService(config: config)
    }
}
