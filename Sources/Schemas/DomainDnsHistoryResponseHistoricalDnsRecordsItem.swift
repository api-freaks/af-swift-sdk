import Foundation

public struct DomainDnsHistoryResponseHistoricalDnsRecordsItem: Codable, Hashable, Sendable {
    public let queryTime: Date
    public let domainName: String
    public let domainRegistered: Bool
    public let dnsTypes: DomainDnsHistoryResponseHistoricalDnsRecordsItemDnsTypes
    public let dnsRecords: [DomainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        queryTime: Date,
        domainName: String,
        domainRegistered: Bool,
        dnsTypes: DomainDnsHistoryResponseHistoricalDnsRecordsItemDnsTypes,
        dnsRecords: [DomainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.queryTime = queryTime
        self.domainName = domainName
        self.domainRegistered = domainRegistered
        self.dnsTypes = dnsTypes
        self.dnsRecords = dnsRecords
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.queryTime = try container.decode(Date.self, forKey: .queryTime)
        self.domainName = try container.decode(String.self, forKey: .domainName)
        self.domainRegistered = try container.decode(Bool.self, forKey: .domainRegistered)
        self.dnsTypes = try container.decode(DomainDnsHistoryResponseHistoricalDnsRecordsItemDnsTypes.self, forKey: .dnsTypes)
        self.dnsRecords = try container.decode([DomainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItem].self, forKey: .dnsRecords)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.queryTime, forKey: .queryTime)
        try container.encode(self.domainName, forKey: .domainName)
        try container.encode(self.domainRegistered, forKey: .domainRegistered)
        try container.encode(self.dnsTypes, forKey: .dnsTypes)
        try container.encode(self.dnsRecords, forKey: .dnsRecords)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case queryTime
        case domainName
        case domainRegistered
        case dnsTypes
        case dnsRecords
    }
}