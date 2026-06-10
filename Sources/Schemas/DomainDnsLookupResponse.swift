import Foundation

public struct DomainDnsLookupResponse: Codable, Hashable, Sendable {
    /// Indicates whether the query was processed successfully.
    public let status: Bool
    /// Time at which the query was made (Format:YYYY-MM-DD HH:mm:ss).
    public let queryTime: Date
    /// Queried domain.
    public let domainName: String
    /// Indicates whether the domain is registered.
    public let domainRegistered: Bool
    public let dnsTypes: DomainDnsLookupResponseDnsTypes
    /// List of DNS records, each based on its type.
    public let dnsRecords: [DomainDnsLookupResponseDnsRecordsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: Bool,
        queryTime: Date,
        domainName: String,
        domainRegistered: Bool,
        dnsTypes: DomainDnsLookupResponseDnsTypes,
        dnsRecords: [DomainDnsLookupResponseDnsRecordsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.queryTime = queryTime
        self.domainName = domainName
        self.domainRegistered = domainRegistered
        self.dnsTypes = dnsTypes
        self.dnsRecords = dnsRecords
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(Bool.self, forKey: .status)
        self.queryTime = try container.decode(Date.self, forKey: .queryTime)
        self.domainName = try container.decode(String.self, forKey: .domainName)
        self.domainRegistered = try container.decode(Bool.self, forKey: .domainRegistered)
        self.dnsTypes = try container.decode(DomainDnsLookupResponseDnsTypes.self, forKey: .dnsTypes)
        self.dnsRecords = try container.decode([DomainDnsLookupResponseDnsRecordsItem].self, forKey: .dnsRecords)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.queryTime, forKey: .queryTime)
        try container.encode(self.domainName, forKey: .domainName)
        try container.encode(self.domainRegistered, forKey: .domainRegistered)
        try container.encode(self.dnsTypes, forKey: .dnsTypes)
        try container.encode(self.dnsRecords, forKey: .dnsRecords)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case queryTime
        case domainName
        case domainRegistered
        case dnsTypes
        case dnsRecords
    }
}