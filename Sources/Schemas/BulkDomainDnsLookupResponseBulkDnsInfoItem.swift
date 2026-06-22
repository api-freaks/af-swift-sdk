import Foundation

public struct BulkDomainDnsLookupResponseBulkDnsInfoItem: Codable, Hashable, Sendable {
    /// Indicates whether the query was processed successfully.
    public let status: Bool
    /// Time at which the query was made (Format:YYYY-MM-DD HH:mm:ss).
    public let queryTime: Date
    /// Queried domain.
    public let domainName: String?
    /// Indicates whether the domain is registered.
    public let domainRegistered: Bool?
    /// IP address associated with the queried domain.
    public let ipAddress: String?
    public let dnsTypes: BulkDomainDnsLookupResponseBulkDnsInfoItemDnsTypes
    /// List of DNS records, each based on its type.
    public let dnsRecords: [BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: Bool,
        queryTime: Date,
        domainName: String? = nil,
        domainRegistered: Bool? = nil,
        ipAddress: String? = nil,
        dnsTypes: BulkDomainDnsLookupResponseBulkDnsInfoItemDnsTypes,
        dnsRecords: [BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.queryTime = queryTime
        self.domainName = domainName
        self.domainRegistered = domainRegistered
        self.ipAddress = ipAddress
        self.dnsTypes = dnsTypes
        self.dnsRecords = dnsRecords
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(Bool.self, forKey: .status)
        self.queryTime = try container.decode(Date.self, forKey: .queryTime)
        self.domainName = try container.decodeIfPresent(String.self, forKey: .domainName)
        self.domainRegistered = try container.decodeIfPresent(Bool.self, forKey: .domainRegistered)
        self.ipAddress = try container.decodeIfPresent(String.self, forKey: .ipAddress)
        self.dnsTypes = try container.decode(BulkDomainDnsLookupResponseBulkDnsInfoItemDnsTypes.self, forKey: .dnsTypes)
        self.dnsRecords = try container.decode([BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItem].self, forKey: .dnsRecords)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.queryTime, forKey: .queryTime)
        try container.encodeIfPresent(self.domainName, forKey: .domainName)
        try container.encodeIfPresent(self.domainRegistered, forKey: .domainRegistered)
        try container.encodeIfPresent(self.ipAddress, forKey: .ipAddress)
        try container.encode(self.dnsTypes, forKey: .dnsTypes)
        try container.encode(self.dnsRecords, forKey: .dnsRecords)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case queryTime
        case domainName
        case domainRegistered
        case ipAddress
        case dnsTypes
        case dnsRecords
    }
}