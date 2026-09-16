import Foundation

/// Registrar of record for a domain, as published by either the registrar or the registry.
public struct DomainWhoisLookupV2ResponseRegistryDataDomainRegistrar: Codable, Hashable, Sendable {
    /// IANA registrar ID.
    public let ianaId: String?
    /// Registrar identifier.
    public let id: String?
    /// Type of registrar ID (e.g. IANA).
    public let idType: String?
    /// Registrar handle.
    public let handle: String?
    /// Registry-specific registrar ID.
    public let registryId: String?
    /// Registry authority name.
    public let authoritativeRegistryName: String?
    /// Registrar organization number.
    public let organizationNumber: String?
    /// Indicates if the registrar is a sponsor.
    public let isSponsor: Bool?
    /// Registrar's ICANN accreditation status (e.g. accredited), when published at the registrar level.
    public let status: String?
    /// Registered name of the registrar.
    public let registrarName: String?
    /// Lowercased, normalized form of the registrar name, when published at the registrar level.
    public let normalizedName: String?
    /// WHOIS server operated by the registrar.
    public let whoisServer: String?
    /// RDAP server URL operated by the registrar, when published at the registrar level.
    public let rdapServer: String?
    /// Registrar's website URL.
    public let websiteUrl: String?
    /// Registrar abuse or contact email address.
    public let emailAddress: String?
    /// Registrar contact phone number.
    public let phoneNumber: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ianaId: String? = nil,
        id: String? = nil,
        idType: String? = nil,
        handle: String? = nil,
        registryId: String? = nil,
        authoritativeRegistryName: String? = nil,
        organizationNumber: String? = nil,
        isSponsor: Bool? = nil,
        status: String? = nil,
        registrarName: String? = nil,
        normalizedName: String? = nil,
        whoisServer: String? = nil,
        rdapServer: String? = nil,
        websiteUrl: String? = nil,
        emailAddress: String? = nil,
        phoneNumber: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.ianaId = ianaId
        self.id = id
        self.idType = idType
        self.handle = handle
        self.registryId = registryId
        self.authoritativeRegistryName = authoritativeRegistryName
        self.organizationNumber = organizationNumber
        self.isSponsor = isSponsor
        self.status = status
        self.registrarName = registrarName
        self.normalizedName = normalizedName
        self.whoisServer = whoisServer
        self.rdapServer = rdapServer
        self.websiteUrl = websiteUrl
        self.emailAddress = emailAddress
        self.phoneNumber = phoneNumber
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ianaId = try container.decodeIfPresent(String.self, forKey: .ianaId)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.idType = try container.decodeIfPresent(String.self, forKey: .idType)
        self.handle = try container.decodeIfPresent(String.self, forKey: .handle)
        self.registryId = try container.decodeIfPresent(String.self, forKey: .registryId)
        self.authoritativeRegistryName = try container.decodeIfPresent(String.self, forKey: .authoritativeRegistryName)
        self.organizationNumber = try container.decodeIfPresent(String.self, forKey: .organizationNumber)
        self.isSponsor = try container.decodeIfPresent(Bool.self, forKey: .isSponsor)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.registrarName = try container.decodeIfPresent(String.self, forKey: .registrarName)
        self.normalizedName = try container.decodeIfPresent(String.self, forKey: .normalizedName)
        self.whoisServer = try container.decodeIfPresent(String.self, forKey: .whoisServer)
        self.rdapServer = try container.decodeIfPresent(String.self, forKey: .rdapServer)
        self.websiteUrl = try container.decodeIfPresent(String.self, forKey: .websiteUrl)
        self.emailAddress = try container.decodeIfPresent(String.self, forKey: .emailAddress)
        self.phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.ianaId, forKey: .ianaId)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.idType, forKey: .idType)
        try container.encodeIfPresent(self.handle, forKey: .handle)
        try container.encodeIfPresent(self.registryId, forKey: .registryId)
        try container.encodeIfPresent(self.authoritativeRegistryName, forKey: .authoritativeRegistryName)
        try container.encodeIfPresent(self.organizationNumber, forKey: .organizationNumber)
        try container.encodeIfPresent(self.isSponsor, forKey: .isSponsor)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.registrarName, forKey: .registrarName)
        try container.encodeIfPresent(self.normalizedName, forKey: .normalizedName)
        try container.encodeIfPresent(self.whoisServer, forKey: .whoisServer)
        try container.encodeIfPresent(self.rdapServer, forKey: .rdapServer)
        try container.encodeIfPresent(self.websiteUrl, forKey: .websiteUrl)
        try container.encodeIfPresent(self.emailAddress, forKey: .emailAddress)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ianaId = "iana_id"
        case id
        case idType = "id_type"
        case handle
        case registryId = "registry_id"
        case authoritativeRegistryName = "authoritative_registry_name"
        case organizationNumber = "organization_number"
        case isSponsor = "is_sponsor"
        case status
        case registrarName = "registrar_name"
        case normalizedName = "normalized_name"
        case whoisServer = "whois_server"
        case rdapServer = "rdap_server"
        case websiteUrl = "website_url"
        case emailAddress = "email_address"
        case phoneNumber = "phone_number"
    }
}