import Foundation

/// Wrapper object containing one WHOIS result or error per requested domain, in request order.
public struct BulkDomainWhoisLookupV2Response: Codable, Hashable, Sendable {
    /// Array of per-domain results, one entry per requested domain. Each entry is either a full WHOIS result or, if that domain could not be resolved, an error object.
    public let bulkWhoisResponse: [BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bulkWhoisResponse: [BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bulkWhoisResponse = bulkWhoisResponse
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bulkWhoisResponse = try container.decode([BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItem].self, forKey: .bulkWhoisResponse)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bulkWhoisResponse, forKey: .bulkWhoisResponse)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bulkWhoisResponse = "bulk_whois_response"
    }
}