import Foundation

public struct BulkDomainAvailabilityCheckResponse: Codable, Hashable, Sendable {
    /// Deprecated: the API returns this field as `bulk_domain_availability_response`; read `bulk_domain_availability_response` instead.
    public let bulkDomainAvailableResponse: [BulkDomainAvailabilityCheckResponseBulkDomainAvailableResponseItem]?
    public let bulkDomainAvailabilityResponse: [BulkDomainAvailabilityCheckResponseBulkDomainAvailabilityResponseItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bulkDomainAvailableResponse: [BulkDomainAvailabilityCheckResponseBulkDomainAvailableResponseItem]? = nil,
        bulkDomainAvailabilityResponse: [BulkDomainAvailabilityCheckResponseBulkDomainAvailabilityResponseItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bulkDomainAvailableResponse = bulkDomainAvailableResponse
        self.bulkDomainAvailabilityResponse = bulkDomainAvailabilityResponse
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bulkDomainAvailableResponse = try container.decodeIfPresent([BulkDomainAvailabilityCheckResponseBulkDomainAvailableResponseItem].self, forKey: .bulkDomainAvailableResponse)
        self.bulkDomainAvailabilityResponse = try container.decodeIfPresent([BulkDomainAvailabilityCheckResponseBulkDomainAvailabilityResponseItem].self, forKey: .bulkDomainAvailabilityResponse)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.bulkDomainAvailableResponse, forKey: .bulkDomainAvailableResponse)
        try container.encodeIfPresent(self.bulkDomainAvailabilityResponse, forKey: .bulkDomainAvailabilityResponse)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bulkDomainAvailableResponse = "bulk_domain_available_response"
        case bulkDomainAvailabilityResponse = "bulk_domain_availability_response"
    }
}