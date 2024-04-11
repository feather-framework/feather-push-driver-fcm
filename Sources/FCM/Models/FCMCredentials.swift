//
//  PayloadTests.swift
//  FCMTests
//
//  Created by Tibor Bodecs on 2023. 01. 16..
//

/// fcm credentials
public struct FCMCredentials: Sendable, Codable {

    enum CodingKeys: String, CodingKey {
        /// type
        case type = "type"
        /// project id
        case projectId = "project_id"
        /// private key id
        case privateKeyId = "private_key_id"
        /// private key
        case privateKey = "private_key"
        /// client email
        case clientEmail = "client_email"
        /// client id
        case clientId = "client_id"
        /// auth uri
        case authURI = "auth_uri"
        /// token uri
        case tokenURI = "token_uri"
        /// auth provider x509 cert url
        case authProviderX509CertURL = "auth_provider_x509_cert_url"
        /// client x509 cert url
        case clientX509CertURL = "client_x509_cert_url"
        /// universe domain
        case universeDomain = "universe_domain"
    }

    /// type
    public let type: String
    /// project id
    public let projectId: String
    /// private key id
    public let privateKeyId: String
    /// private key
    public let privateKey: String
    /// client email
    public let clientEmail: String
    /// client id
    public let clientId: String
    /// auth uri
    public let authURI: String
    /// token uri
    public let tokenURI: String
    /// auth provider x509 cert url
    public let authProviderX509CertURL: String
    /// client x509 cert url
    public let clientX509CertURL: String
    /// universe domain
    public let universeDomain: String

    /// fcm credentials init
    public init(
        type: String,
        projectId: String,
        privateKeyId: String,
        privateKey: String,
        clientEmail: String,
        clientId: String,
        authURI: String,
        tokenURI: String,
        authProviderX509CertURL: String,
        clientX509CertURL: String,
        universeDomain: String
    ) {
        self.type = type
        self.projectId = projectId
        self.privateKeyId = privateKeyId
        self.privateKey = privateKey
        self.clientEmail = clientEmail
        self.clientId = clientId
        self.authURI = authURI
        self.tokenURI = tokenURI
        self.authProviderX509CertURL = authProviderX509CertURL
        self.clientX509CertURL = clientX509CertURL
        self.universeDomain = universeDomain
    }
}
