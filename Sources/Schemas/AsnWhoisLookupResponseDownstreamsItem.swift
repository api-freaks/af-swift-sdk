import Foundation

public struct AsnWhoisLookupResponseDownstreamsItem: Codable, Hashable, Sendable {
    public let asNumber: String?
    public let description: String?
    public let country: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        asNumber: String? = nil,
        description: String? = nil,
        country: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.asNumber = asNumber
        self.description = description
        self.country = country
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.asNumber = try container.decodeIfPresent(String.self, forKey: .asNumber)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.asNumber, forKey: .asNumber)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.country, forKey: .country)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case asNumber
        case description
        case country
    }
}