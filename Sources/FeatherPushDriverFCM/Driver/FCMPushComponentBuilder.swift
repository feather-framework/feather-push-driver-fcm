//
//  FCMPushComponentBuillder.swift
//  FeatherPushDriverFCM
//

import FeatherComponent

struct FCMPushComponentBuilder: ComponentBuilder {

    func build(using config: ComponentConfig) throws -> Component {
        FCMPushComponent(config: config)
    }

}
