import Foundation

public struct BulkDomainAvailabilityCheckResponse: Codable, Hashable, Sendable {
    public let bulkDomainAvailableResponse: [BulkDomainAvailabilityCheckResponseBulkDomainAvailableResponseItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bulkDomainAvailableResponse: [BulkDomainAvailabilityCheckResponseBulkDomainAvailableResponseItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bulkDomainAvailableResponse = bulkDomainAvailableResponse
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bulkDomainAvailableResponse = try container.decodeIfPresent([BulkDomainAvailabilityCheckResponseBulkDomainAvailableResponseItem].self, forKey: .bulkDomainAvailableResponse)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.bulkDomainAvailableResponse, forKey: .bulkDomainAvailableResponse)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bulkDomainAvailableResponse = "bulk_domain_available_response"
    }
}