//
//  FCMPushComponentBuillder.swift
//  FeatherPushDriverFCM
//

import FeatherComponent

struct FCMPushComponentFactory: ComponentFactory {

    func build(using config: ComponentConfig) throws -> Component {
        FCMPushComponent(config: config)
    }

}
