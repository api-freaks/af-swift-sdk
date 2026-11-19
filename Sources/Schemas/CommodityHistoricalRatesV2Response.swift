import Foundation

public struct CommodityHistoricalRatesV2Response: Codable, Hashable, Sendable {
    /// API request success indicator. "true" for successful requests.
    public let success: Bool
    /// Date for which the user requested the commodity price. Format: YYYY-MM-DD.
    public let date: String
    /// Map of requested commodity symbols to their OHLC price data on the given date.
    public let rates: [String: CommodityHistoricalRatesV2ResponseRatesValue]
    /// Present only on a 206 Partial Content response, when some requested symbols could not be resolved. Map of each unresolved symbol to a detail message and optional close-match suggestions.
    public let unresolved: [String: CommodityHistoricalRatesV2ResponseUnresolvedValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        success: Bool,
        date: String,
        rates: [String: CommodityHistoricalRatesV2ResponseRatesValue],
        unresolved: [String: CommodityHistoricalRatesV2ResponseUnresolvedValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.success = success
        self.date = date
        self.rates = rates
        self.unresolved = unresolved
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.date = try container.decode(String.self, forKey: .date)
        self.rates = try container.decode([String: CommodityHistoricalRatesV2ResponseRatesValue].self, forKey: .rates)
        self.unresolved = try container.decodeIfPresent([String: CommodityHistoricalRatesV2ResponseUnresolvedValue].self, forKey: .unresolved)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.success, forKey: .success)
        try container.encode(self.date, forKey: .date)
        try container.encode(self.rates, forKey: .rates)
        try container.encodeIfPresent(self.unresolved, forKey: .unresolved)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case success
        case date
        case rates
        case unresolved
    }
}