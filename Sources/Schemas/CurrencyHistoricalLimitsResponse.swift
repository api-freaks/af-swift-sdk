import Foundation

public struct CurrencyHistoricalLimitsResponse: Codable, Hashable, Sendable {
    /// Availability date range per currency, formatted "YYYY-MM-DD to YYYY-MM-DD".
    public let availabilityPeriod: [String: String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        availabilityPeriod: [String: String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.availabilityPeriod = availabilityPeriod
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.availabilityPeriod = try container.decode([String: String].self, forKey: .availabilityPeriod)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.availabilityPeriod, forKey: .availabilityPeriod)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case availabilityPeriod
    }
}