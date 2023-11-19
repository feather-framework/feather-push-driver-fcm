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
import FeatherService
import FeatherPush
import FeatherPushDriverFCM
import XCTFeatherPush
import FCM

final class FeatherPushDriverFCMTests: XCTestCase {

    func testFCMDriverUsingTestSuite() async throws {
        let eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)

        //        do {
        //            let registry = ServiceRegistry()
        //            try await registry.add(
        //                .fcmPush(
        
        //                ),
        //                as: .fcmPush
        //            )
        //
        //            try await registry.run()
        //            let push = try await registry.get(.fcmPush) as! PushService
        //
        //            do {
        //                let suite = PushTestSuite(push)
        //                try await suite.testAll()
        //                try await registry.shutdown()
        //            }
        //            catch {
        //                try await registry.shutdown()
        //                throw error
        //            }
        //        }
        //        catch {
        //            XCTFail("\(error)")
        //        }

        try await eventLoopGroup.shutdownGracefully()
    }

}
