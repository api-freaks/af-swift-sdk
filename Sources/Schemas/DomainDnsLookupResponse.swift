import Foundation

public struct DomainDnsLookupResponse: Codable, Hashable, Sendable {
    /// Indicates whether the query was processed successfully.
    public let status: Bool
    /// Timestamp when the query was executed (format YYYY-MM-DD HH:mm:ss, not ISO 8601).
    public let queryTime: String
    /// Queried domain.
    public let domainName: String?
    /// Indicates whether the domain is registered.
    public let domainRegistered: Bool?
    public let dnsTypes: DomainDnsLookupResponseDnsTypes
    /// List of DNS records, each based on its type.
    public let dnsRecords: [DomainDnsLookupResponseDnsRecordsItem]
    /// IP address queried (present when ipAddress parameter is used instead of host-name).
    public let ipAddress: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: Bool,
        queryTime: String,
        domainName: String? = nil,
        domainRegistered: Bool? = nil,
        dnsTypes: DomainDnsLookupResponseDnsTypes,
        dnsRecords: [DomainDnsLookupResponseDnsRecordsItem],
        ipAddress: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.queryTime = queryTime
        self.domainName = domainName
        self.domainRegistered = domainRegistered
        self.dnsTypes = dnsTypes
        self.dnsRecords = dnsRecords
        self.ipAddress = ipAddress
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(Bool.self, forKey: .status)
        self.queryTime = try container.decode(String.self, forKey: .queryTime)
        self.domainName = try container.decodeIfPresent(String.self, forKey: .domainName)
        self.domainRegistered = try container.decodeIfPresent(Bool.self, forKey: .domainRegistered)
        self.dnsTypes = try container.decode(DomainDnsLookupResponseDnsTypes.self, forKey: .dnsTypes)
        self.dnsRecords = try container.decode([DomainDnsLookupResponseDnsRecordsItem].self, forKey: .dnsRecords)
        self.ipAddress = try container.decodeIfPresent(String.self, forKey: .ipAddress)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.queryTime, forKey: .queryTime)
        try container.encodeIfPresent(self.domainName, forKey: .domainName)
        try container.encodeIfPresent(self.domainRegistered, forKey: .domainRegistered)
        try container.encode(self.dnsTypes, forKey: .dnsTypes)
        try container.encode(self.dnsRecords, forKey: .dnsRecords)
        try container.encodeIfPresent(self.ipAddress, forKey: .ipAddress)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case queryTime
        case domainName
        case domainRegistered
        case dnsTypes
        case dnsRecords
        case ipAddress
    }
}