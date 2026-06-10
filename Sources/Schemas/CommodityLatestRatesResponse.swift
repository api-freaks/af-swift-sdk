import Foundation

public struct CommodityLatestRatesResponse: Codable, Hashable, Sendable {
    /// API request success indicator. 'true' for successful requests.
    public let success: Bool
    /// Unix timestamp indicating when the response was generated.
    public let timestamp: Double
    /// Map containing rate data for all the requested commodities.
    public let rates: [String: Double]
    /// Map containing detailed information for all the requested commodities keyed by commodity symbol.
    public let metadata: [String: CommodityLatestRatesResponseMetadataValue]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        success: Bool,
        timestamp: Double,
        rates: [String: Double],
        metadata: [String: CommodityLatestRatesResponseMetadataValue],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.success = success
        self.timestamp = timestamp
        self.rates = rates
        self.metadata = metadata
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.timestamp = try container.decode(Double.self, forKey: .timestamp)
        self.rates = try container.decode([String: Double].self, forKey: .rates)
        self.metadata = try container.decode([String: CommodityLatestRatesResponseMetadataValue].self, forKey: .metadata)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.success, forKey: .success)
        try container.encode(self.timestamp, forKey: .timestamp)
        try container.encode(self.rates, forKey: .rates)
        try container.encode(self.metadata, forKey: .metadata)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case success
        case timestamp
        case rates
        case metadata
    }
}