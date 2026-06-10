import Foundation

public struct CommodityHistoricalRatesResponse: Codable, Hashable, Sendable {
    /// API request success indicator. "true" for successful requests.
    public let success: Bool
    /// Unix timestamp indicating when the response was generated.
    public let timestamp: Double?
    /// Map containing detailed information for all the requested commodities keyed by commodity symbol.
    public let metadata: [String: CommodityHistoricalRatesResponseMetadataValue]?
    /// Date for which the user requested the commodity price. Format: YYYY-MM-DD.
    public let date: String
    /// Map containing rate data for each available requested commodity symbol, keyed by symbol.
    public let rates: [String: CommodityHistoricalRatesResponseRatesValue]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        success: Bool,
        timestamp: Double? = nil,
        metadata: [String: CommodityHistoricalRatesResponseMetadataValue]? = nil,
        date: String,
        rates: [String: CommodityHistoricalRatesResponseRatesValue],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.success = success
        self.timestamp = timestamp
        self.metadata = metadata
        self.date = date
        self.rates = rates
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.timestamp = try container.decodeIfPresent(Double.self, forKey: .timestamp)
        self.metadata = try container.decodeIfPresent([String: CommodityHistoricalRatesResponseMetadataValue].self, forKey: .metadata)
        self.date = try container.decode(String.self, forKey: .date)
        self.rates = try container.decode([String: CommodityHistoricalRatesResponseRatesValue].self, forKey: .rates)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.success, forKey: .success)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
        try container.encode(self.date, forKey: .date)
        try container.encode(self.rates, forKey: .rates)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case success
        case timestamp
        case metadata
        case date
        case rates
    }
}