import Foundation

public struct BulkDomainAvailabilityCheckResponseBulkDomainAvailableResponseItem: Codable, Hashable, Sendable {
    public let domain: String?
    public let domainAvailability: Bool?
    public let status: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        domain: String? = nil,
        domainAvailability: Bool? = nil,
        status: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.domain = domain
        self.domainAvailability = domainAvailability
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.domain = try container.decodeIfPresent(String.self, forKey: .domain)
        self.domainAvailability = try container.decodeIfPresent(Bool.self, forKey: .domainAvailability)
        self.status = try container.decodeIfPresent(Bool.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.domain, forKey: .domain)
        try container.encodeIfPresent(self.domainAvailability, forKey: .domainAvailability)
        try container.encodeIfPresent(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case domain
        case domainAvailability
        case status
    }
}