import Foundation

public struct BulkDomainDnsLookupResponse: Codable, Hashable, Sendable {
    public let bulkDnsInfo: [BulkDomainDnsLookupResponseBulkDnsInfoItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bulkDnsInfo: [BulkDomainDnsLookupResponseBulkDnsInfoItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bulkDnsInfo = bulkDnsInfo
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bulkDnsInfo = try container.decode([BulkDomainDnsLookupResponseBulkDnsInfoItem].self, forKey: .bulkDnsInfo)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bulkDnsInfo, forKey: .bulkDnsInfo)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bulkDnsInfo = "bulk_dns_info"
    }
}