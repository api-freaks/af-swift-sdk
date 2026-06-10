import Foundation

public struct DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemStrings: Codable, Hashable, Sendable {
    public let name: String
    public let type: Int
    public let dnsType: DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemStringsDnsType
    public let ttl: Int
    public let rawText: String
    public let rRsetType: Int
    public let strings: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        type: Int,
        dnsType: DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemStringsDnsType,
        ttl: Int,
        rawText: String,
        rRsetType: Int,
        strings: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.type = type
        self.dnsType = dnsType
        self.ttl = ttl
        self.rawText = rawText
        self.rRsetType = rRsetType
        self.strings = strings
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(Int.self, forKey: .type)
        self.dnsType = try container.decode(DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemStringsDnsType.self, forKey: .dnsType)
        self.ttl = try container.decode(Int.self, forKey: .ttl)
        self.rawText = try container.decode(String.self, forKey: .rawText)
        self.rRsetType = try container.decode(Int.self, forKey: .rRsetType)
        self.strings = try container.decode([String].self, forKey: .strings)
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
        try container.encode(self.strings, forKey: .strings)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case type
        case dnsType
        case ttl
        case rawText
        case rRsetType
        case strings
    }
}