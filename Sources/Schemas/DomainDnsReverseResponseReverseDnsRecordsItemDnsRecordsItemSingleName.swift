import Foundation

public struct DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemSingleName: Codable, Hashable, Sendable {
    public let name: String
    public let type: Int
    public let dnsType: DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemSingleNameDnsType
    public let ttl: Int
    public let rawText: String
    public let rRsetType: Int
    /// Name server for the domain
    public let singleName: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        type: Int,
        dnsType: DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemSingleNameDnsType,
        ttl: Int,
        rawText: String,
        rRsetType: Int,
        singleName: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.type = type
        self.dnsType = dnsType
        self.ttl = ttl
        self.rawText = rawText
        self.rRsetType = rRsetType
        self.singleName = singleName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(Int.self, forKey: .type)
        self.dnsType = try container.decode(DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemSingleNameDnsType.self, forKey: .dnsType)
        self.ttl = try container.decode(Int.self, forKey: .ttl)
        self.rawText = try container.decode(String.self, forKey: .rawText)
        self.rRsetType = try container.decode(Int.self, forKey: .rRsetType)
        self.singleName = try container.decode(String.self, forKey: .singleName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.dnsType, forKey: .dnsType)
        try container.encode(self.ttl, forKey: .ttl)
        try container.encode(self.rawText, forKey: .rawText)
        try container.encode(self.rRsetType, forKey: .rRsetType)
        try container.encode(self.singleName, forKey: .singleName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case type
        case dnsType
        case ttl
        case rawText
        case rRsetType
        case singleName
    }
}