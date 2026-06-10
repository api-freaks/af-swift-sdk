import Foundation

public struct BulkDomainWhoisLookupResponse: Codable, Hashable, Sendable {
    public let bulkWhoisResponse: [BulkDomainWhoisLookupResponseBulkWhoisResponseItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bulkWhoisResponse: [BulkDomainWhoisLookupResponseBulkWhoisResponseItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bulkWhoisResponse = bulkWhoisResponse
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bulkWhoisResponse = try container.decodeIfPresent([BulkDomainWhoisLookupResponseBulkWhoisResponseItem].self, forKey: .bulkWhoisResponse)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.bulkWhoisResponse, forKey: .bulkWhoisResponse)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bulkWhoisResponse = "bulk_whois_response"
    }
}