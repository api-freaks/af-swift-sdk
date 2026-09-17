import Foundation

/// Registry-level (as opposed to registrar-level) WHOIS data, sourced directly from the TLD registry.
public struct BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactRegistryData: Codable, Hashable, Sendable {
    /// Domain name as recorded by the registry.
    public let domainName: String?
    /// Timestamp when the registry-level record was queried (format YYYY-MM-DD HH:mm:ss, not ISO 8601).
    public let queryTime: String?
    /// Registry WHOIS server that returned this data.
    public let whoisServer: String?
    /// Domain registration status as recorded by the registry.
    public let domainRegistered: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactRegistryDataDomainRegistered?
    /// Domain creation date as recorded by the registry.
    public let createDate: CalendarDate?
    /// Domain last-updated date as recorded by the registry.
    public let updateDate: CalendarDate?
    /// Domain expiry date as recorded by the registry.
    public let expiryDate: CalendarDate?
    /// Name servers as recorded by the registry.
    public let nameServers: [String]?
    /// EPP domain status codes as recorded by the registry.
    public let domainStatus: [String]?
    /// Raw WHOIS text as returned directly by the registry server.
    public let whoisRawRegistery: String?
    /// Registrar of record for a domain, as published by either the registrar or the registry.
    public let domainRegistrar: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactRegistryDataDomainRegistrar?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        domainName: String? = nil,
        queryTime: String? = nil,
        whoisServer: String? = nil,
        domainRegistered: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactRegistryDataDomainRegistered? = nil,
        createDate: CalendarDate? = nil,
        updateDate: CalendarDate? = nil,
        expiryDate: CalendarDate? = nil,
        nameServers: [String]? = nil,
        domainStatus: [String]? = nil,
        whoisRawRegistery: String? = nil,
        domainRegistrar: BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactRegistryDataDomainRegistrar? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.domainName = domainName
        self.queryTime = queryTime
        self.whoisServer = whoisServer
        self.domainRegistered = domainRegistered
        self.createDate = createDate
        self.updateDate = updateDate
        self.expiryDate = expiryDate
        self.nameServers = nameServers
        self.domainStatus = domainStatus
        self.whoisRawRegistery = whoisRawRegistery
        self.domainRegistrar = domainRegistrar
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.domainName = try container.decodeIfPresent(String.self, forKey: .domainName)
        self.queryTime = try container.decodeIfPresent(String.self, forKey: .queryTime)
        self.whoisServer = try container.decodeIfPresent(String.self, forKey: .whoisServer)
        self.domainRegistered = try container.decodeIfPresent(BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactRegistryDataDomainRegistered.self, forKey: .domainRegistered)
        self.createDate = try container.decodeIfPresent(CalendarDate.self, forKey: .createDate)
        self.updateDate = try container.decodeIfPresent(CalendarDate.self, forKey: .updateDate)
        self.expiryDate = try container.decodeIfPresent(CalendarDate.self, forKey: .expiryDate)
        self.nameServers = try container.decodeIfPresent([String].self, forKey: .nameServers)
        self.domainStatus = try container.decodeIfPresent([String].self, forKey: .domainStatus)
        self.whoisRawRegistery = try container.decodeIfPresent(String.self, forKey: .whoisRawRegistery)
        self.domainRegistrar = try container.decodeIfPresent(BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactRegistryDataDomainRegistrar.self, forKey: .domainRegistrar)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.domainName, forKey: .domainName)
        try container.encodeIfPresent(self.queryTime, forKey: .queryTime)
        try container.encodeIfPresent(self.whoisServer, forKey: .whoisServer)
        try container.encodeIfPresent(self.domainRegistered, forKey: .domainRegistered)
        try container.encodeIfPresent(self.createDate, forKey: .createDate)
        try container.encodeIfPresent(self.updateDate, forKey: .updateDate)
        try container.encodeIfPresent(self.expiryDate, forKey: .expiryDate)
        try container.encodeIfPresent(self.nameServers, forKey: .nameServers)
        try container.encodeIfPresent(self.domainStatus, forKey: .domainStatus)
        try container.encodeIfPresent(self.whoisRawRegistery, forKey: .whoisRawRegistery)
        try container.encodeIfPresent(self.domainRegistrar, forKey: .domainRegistrar)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case domainName = "domain_name"
        case queryTime = "query_time"
        case whoisServer = "whois_server"
        case domainRegistered = "domain_registered"
        case createDate = "create_date"
        case updateDate = "update_date"
        case expiryDate = "expiry_date"
        case nameServers = "name_servers"
        case domainStatus = "domain_status"
        case whoisRawRegistery = "whois_raw_registery"
        case domainRegistrar = "domain_registrar"
    }
}