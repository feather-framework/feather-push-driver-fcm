//
//  File.swift
//
//
//  Created by Tibor Bodecs on 19/11/2023.
//

import Foundation
import AsyncHTTPClient
import FCM
import XCTest

final class PushTests: XCTestCase {

    var type: String {
        ProcessInfo.processInfo.environment["PUSH_TYPE"]!
    }

    var projectId: String {
        ProcessInfo.processInfo.environment["PUSH_PROJECT_ID"]!
    }

    var privateKeyId: String {
        ProcessInfo.processInfo.environment["PUSH_PRIVATE_KEY_ID"]!
    }

    var privateKey: String {
        ProcessInfo.processInfo.environment["PUSH_PRIVATE_KEY"]!
    }

    var clientEmail: String {
        ProcessInfo.processInfo.environment["PUSH_CLIENT_EMAIL"]!
    }
    
    var clientId: String {
        ProcessInfo.processInfo.environment["PUSH_CLIENT_ID"]!
    }
    
    var certURL: String {
        ProcessInfo.processInfo.environment["PUSH_CERT_URL"]!
    }
    
    var token: String {
        ProcessInfo.processInfo.environment["PUSH_TOKEN"]!
    }
    
    var messageType: String {
        ProcessInfo.processInfo.environment["PUSH_MESSAGE_TYPE"] ?? "data"
    }

    func testPush() async throws {
        /*
         {
           "type": "service_account",
           "project_id": "your_project_id",
           "private_key_id": "your_private_key_id",
           "private_key": "your_private_key",
           "client_email": "your_client_email",
           "client_id": "your_client_id",
           "auth_uri": "https://accounts.google.com/o/oauth2/auth",
           "token_uri": "https://oauth2.googleapis.com/token",
           "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
           "client_x509_cert_url": "your_client_x509_cert_url",
           "universe_domain": "googleapis.com"
         }
         */
        let credentials = FCMCredentials(
            type: type,
            projectId: projectId,
            privateKeyId: privateKeyId,
            privateKey: privateKey,
            clientEmail: clientEmail,
            clientId: clientId,
            authURI: "https://accounts.google.com/o/oauth2/auth",
            tokenURI: "https://oauth2.googleapis.com/token",
            authProviderX509CertURL:
                "https://www.googleapis.com/oauth2/v1/certs",
            clientX509CertURL: certURL,
            universeDomain: "googleapis.com"
        )

        let httpClient = HTTPClient(eventLoopGroupProvider: .singleton)
        let fcmClient = FCMClient(client: httpClient, credentials: credentials)

        do {
            let payload = FCMPayload(
                message: .init(
                    token: token,
                    type: messageType == "data" ? .data : .notification,
                    contents: .init(
                        title: "Test push notification",
                        body: "Test body for the push notification",
                        userInfo: ["foo": "bar"]
                    )
                )
            )

            try await fcmClient.send([payload])
        }
        catch {
            try await httpClient.shutdown()
            XCTFail("\(error)")
        }
        try await httpClient.shutdown()
    }
}
