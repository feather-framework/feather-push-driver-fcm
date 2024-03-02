//
//  FCMPushComponent.swift
//  FeatherPushDriverFCM
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import FeatherComponent
import FeatherPush
import FCM

extension Platform {

    func toPushType() -> FCMPayload.Message.PushType {
        switch self {
        case .android:
            return .data
        default:
            return .notification
        }
    }
}

@dynamicMemberLookup
struct FCMPushComponent {

    let config: ComponentConfig

    subscript<T>(
        dynamicMember keyPath: KeyPath<FCMPushComponentContext, T>
    ) -> T {
        let context = config.context as! FCMPushComponentContext
        return context[keyPath: keyPath]
    }

    init(config: ComponentConfig) {
        self.config = config
    }
}

extension FCMPushComponent: PushComponent {
    
    func send(
        notification: Notification,
        to recipients: [Recipient]
    ) async throws {
        guard !recipients.isEmpty else {
            return
        }
        let client = FCMClient(
            client: self.client,
            credentials: self.credentials,
            timeout: .seconds(10),
            logger: logger
        )

        let payload = recipients.map {
            FCMPayload(
                message: .init(
                    token: $0.token,
                    type: $0.platform.toPushType(),
                    contents: .init(
                        title: notification.title,
                        body: notification.body,
                        userInfo: notification.userInfo
                    )
                )
            )
        }

        try await client.send(payload)
    }
}
