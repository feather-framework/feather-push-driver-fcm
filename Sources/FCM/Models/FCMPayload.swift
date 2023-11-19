//
//  FCMPayload.swift
//  FCM
//
//  Created by Tibor Bodecs on 2023. 01. 16..
//

public struct FCMPayload: Encodable {

    public struct Message: Encodable {

        public enum PushType: String, Encodable {
            case data
            case notification
        }

        public struct Contents: Encodable {

            struct CodingKeys: CodingKey, ExpressibleByStringLiteral {

                static let title: Self = "title"
                static let body: Self = "body"

                var stringValue: String
                var intValue: Int?

                init(stringLiteral value: StringLiteralType) {
                    self.stringValue = value
                }

                init?(stringValue: String) {
                    self.stringValue = stringValue
                }

                init?(intValue: Int) {
                    nil
                }
            }

            public let title: String
            public let body: String
            public let userInfo: [String: String]

            public init(
                title: String,
                body: String,
                userInfo: [String: String] = [:]
            ) {
                self.title = title
                self.body = body
                self.userInfo = userInfo
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(self.title, forKey: CodingKeys.title)
                try container.encode(self.body, forKey: CodingKeys.body)

                for (k, value) in userInfo {
                    guard let key = CodingKeys(stringValue: k) else {
                        continue
                    }
                    guard
                        key.stringValue != CodingKeys.title.stringValue,
                        key.stringValue != CodingKeys.body.stringValue
                    else {
                        throw EncodingError.invalidValue(
                            value,
                            .init(
                                codingPath: [key],
                                debugDescription: "Duplicate coding keys."
                            )
                        )
                    }
                    try container.encode(value, forKey: key)
                }
            }

        }

        struct CodingKeys: CodingKey, ExpressibleByStringLiteral {

            static let token: Self = "token"

            var stringValue: String
            var intValue: Int?

            init(_ value: String) {
                self.stringValue = value
            }

            init(stringLiteral value: StringLiteralType) {
                self.stringValue = value
            }

            init?(stringValue: String) {
                self.stringValue = stringValue
            }

            init?(intValue: Int) {
                nil
            }
        }

        public let token: String
        public let type: PushType
        public let contents: Contents

        public init(
            token: String,
            type: PushType,
            contents: Contents
        ) {
            self.token = token
            self.type = type
            self.contents = contents
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(self.token, forKey: CodingKeys.token)
            try container.encode(self.contents, forKey: .init(type.rawValue))
        }
    }

    public let message: Message

    public init(message: Message) {
        self.message = message
    }
}
