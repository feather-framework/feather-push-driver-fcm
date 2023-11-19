//
//  PayloadTests.swift
//  FCMTests
//
//  Created by Tibor Bodecs on 2023. 01. 16..
//

public struct FCMCredentials: Sendable, Codable {

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case projectId = "project_id"
        case privateKeyId = "private_key_id"
        case privateKey = "private_key"
        case clientEmail = "client_email"
        case clientId = "client_id"
        case authURI = "auth_uri"
        case tokenURI = "token_uri"
        case authProviderX509CertURL = "auth_provider_x509_cert_url"
        case clientX509CertURL = "client_x509_cert_url"
        case universeDomain = "universe_domain"
    }

    public let type: String
    public let projectId: String
    public let privateKeyId: String
    public let privateKey: String
    public let clientEmail: String
    public let clientId: String
    public let authURI: String
    public let tokenURI: String
    public let authProviderX509CertURL: String
    public let clientX509CertURL: String
    public let universeDomain: String

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
