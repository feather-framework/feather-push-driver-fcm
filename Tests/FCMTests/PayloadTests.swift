//
//  PayloadTests.swift
//  FCMTests
//
//  Created by Tibor Bodecs on 2023. 01. 16..
//

import Foundation
import FCM
import XCTest

final class PayloadTests: XCTestCase {

    func testBasicEncoding() throws {
        let payload = FCMPayload(
            message: .init(
                token: "token",
                type: .data,
                contents: .init(
                    title: "title",
                    body: "body",
                    userInfo: ["foo": "bar"]
                )
            )
        )

        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let data = try encoder.encode(payload)
        guard let json = String(data: data, encoding: .utf8) else {
            return XCTFail()
        }
        let exp = """
            {
              "message" : {
                "data" : {
                  "body" : "body",
                  "foo" : "bar",
                  "title" : "title"
                },
                "token" : "token"
              }
            }
            """
        XCTAssertEqual(json, exp)
    }

    func testEmptyUserInfoEncoding() throws {
        let payload = FCMPayload(
            message: .init(
                token: "token",
                type: .notification,
                contents: .init(
                    title: "title",
                    body: "body"
                )
            )
        )

        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let data = try encoder.encode(payload)
        guard let json = String(data: data, encoding: .utf8) else {
            return XCTFail()
        }
        let exp = """
            {
              "message" : {
                "notification" : {
                  "body" : "body",
                  "title" : "title"
                },
                "token" : "token"
              }
            }
            """
        XCTAssertEqual(json, exp)
    }

}
