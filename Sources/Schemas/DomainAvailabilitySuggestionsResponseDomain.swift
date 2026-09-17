import Foundation

/// Returned when `sug=false` — availability for the queried domain only, no suggestions.
public struct DomainAvailabilitySuggestionsResponseDomain: Codable, Hashable, Sendable {
    public let domain: String?
    public let domainAvailability: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        domain: String? = nil,
        domainAvailability: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.domain = domain
        self.domainAvailability = domainAvailability
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.domain = try container.decodeIfPresent(String.self, forKey: .domain)
        self.domainAvailability = try container.decodeIfPresent(Bool.self, forKey: .domainAvailability)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.domain, forKey: .domain)
        try container.encodeIfPresent(self.domainAvailability, forKey: .domainAvailability)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case domain
        case domainAvailability
    }
}