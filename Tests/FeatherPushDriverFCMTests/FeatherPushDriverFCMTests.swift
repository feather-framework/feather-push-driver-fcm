//
//  FeatherPushDriverFCMTests.swift
//  FeatherPushDriverFCMTests
//
//  Created by Tibor Bodecs on 2023. 01. 16..
//

import NIO
import Logging
import Foundation
import XCTest
import FeatherComponent
import FeatherPush
import FeatherPushDriverFCM
import XCTFeatherPush
import AsyncHTTPClient
import FCM

final class FeatherPushDriverFCMTests: XCTestCase {

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

    func testFCMDriverUsingTestSuite() async throws {
        let eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)

        do {
            let registry = ComponentRegistry()

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

            try await registry.addPush(
                FCMPushComponentContext(
                    client: httpClient,
                    credentials: credentials
                )
            )

            let push = try await registry.push()
            do {
                let suite = PushTestSuite(push)
                try await suite.testAll(from: "from", to: "to")

            }
            catch {
                throw error
            }

            try await httpClient.shutdown()
        }
        catch {
            XCTFail("\(error)")
        }

        try await eventLoopGroup.shutdownGracefully()
    }

}
