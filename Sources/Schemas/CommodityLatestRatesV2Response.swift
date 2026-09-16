import Foundation

public struct CommodityLatestRatesV2Response: Codable, Hashable, Sendable {
    /// API request success indicator. "true" for successful requests.
    public let success: Bool
    /// Unix timestamp (seconds) indicating when the response was generated.
    public let timestamp: Int
    /// Map of requested commodity symbols to their current live price.
    public let rates: [String: Double]
    /// Map containing unit and quote currency metadata for all requested commodities, keyed by commodity symbol.
    public let metadata: [String: CommodityLatestRatesV2ResponseMetadataValue]
    /// Present only when currency conversion for the requested `quote` is temporarily unavailable; rates are returned in each commodity's default currency instead.
    public let warning: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        success: Bool,
        timestamp: Int,
        rates: [String: Double],
        metadata: [String: CommodityLatestRatesV2ResponseMetadataValue],
        warning: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.success = success
        self.timestamp = timestamp
        self.rates = rates
        self.metadata = metadata
        self.warning = warning
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.timestamp = try container.decode(Int.self, forKey: .timestamp)
        self.rates = try container.decode([String: Double].self, forKey: .rates)
        self.metadata = try container.decode([String: CommodityLatestRatesV2ResponseMetadataValue].self, forKey: .metadata)
        self.warning = try container.decodeIfPresent(String.self, forKey: .warning)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.success, forKey: .success)
        try container.encode(self.timestamp, forKey: .timestamp)
        try container.encode(self.rates, forKey: .rates)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encodeIfPresent(self.warning, forKey: .warning)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case success
        case timestamp
        case rates
        case metadata
        case warning
    }
}