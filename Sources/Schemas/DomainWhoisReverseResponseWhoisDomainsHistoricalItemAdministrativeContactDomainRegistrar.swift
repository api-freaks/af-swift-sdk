import Foundation

public struct DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContactDomainRegistrar: Codable, Hashable, Sendable {
    public let ianaId: String?
    public let registrarName: String?
    public let whoisServer: String?
    public let websiteUrl: String?
    public let emailAddress: String?
    public let phoneNumber: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ianaId: String? = nil,
        registrarName: String? = nil,
        whoisServer: String? = nil,
        websiteUrl: String? = nil,
        emailAddress: String? = nil,
        phoneNumber: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.ianaId = ianaId
        self.registrarName = registrarName
        self.whoisServer = whoisServer
        self.websiteUrl = websiteUrl
        self.emailAddress = emailAddress
        self.phoneNumber = phoneNumber
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ianaId = try container.decodeIfPresent(String.self, forKey: .ianaId)
        self.registrarName = try container.decodeIfPresent(String.self, forKey: .registrarName)
        self.whoisServer = try container.decodeIfPresent(String.self, forKey: .whoisServer)
        self.websiteUrl = try container.decodeIfPresent(String.self, forKey: .websiteUrl)
        self.emailAddress = try container.decodeIfPresent(String.self, forKey: .emailAddress)
        self.phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.ianaId, forKey: .ianaId)
        try container.encodeIfPresent(self.registrarName, forKey: .registrarName)
        try container.encodeIfPresent(self.whoisServer, forKey: .whoisServer)
        try container.encodeIfPresent(self.websiteUrl, forKey: .websiteUrl)
        try container.encodeIfPresent(self.emailAddress, forKey: .emailAddress)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ianaId = "iana_id"
        case registrarName = "registrar_name"
        case whoisServer = "whois_server"
        case websiteUrl = "website_url"
        case emailAddress = "email_address"
        case phoneNumber = "phone_number"
    }
}