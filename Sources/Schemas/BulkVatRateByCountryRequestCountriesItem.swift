import Foundation

public struct BulkVatRateByCountryRequestCountriesItem: Codable, Hashable, Sendable {
    /// Country identifier in Alpha-2 (US), Alpha-3 (USA), or full name (United_States). Pair with "state" for regional lookup; values are case-insensitive and may use underscores.
    public let country: String
    /// Optional state identifier in Alpha-2 (NY) or full name (New_York). Use with the country field for state-level VAT; values are case-insensitive and may use underscores.
    public let state: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        country: String,
        state: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.country = country
        self.state = state
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.country = try container.decode(String.self, forKey: .country)
        self.state = try container.decodeIfPresent(String.self, forKey: .state)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.country, forKey: .country)
        try container.encodeIfPresent(self.state, forKey: .state)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case country
        case state
    }
}