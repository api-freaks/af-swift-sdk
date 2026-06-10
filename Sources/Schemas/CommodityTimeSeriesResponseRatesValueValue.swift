import Foundation

public struct CommodityTimeSeriesResponseRatesValueValue: Codable, Hashable, Sendable {
    /// Opening price of the commodity on the given date.
    public let open: Double
    /// Highest price of the commodity on the given date.
    public let high: Double
    /// Lowest price of the commodity on the given date.
    public let low: Double
    /// Closing price of the commodity on the given date.
    public let close: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        open: Double,
        high: Double,
        low: Double,
        close: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.open = open
        self.high = high
        self.low = low
        self.close = close
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.open = try container.decode(Double.self, forKey: .open)
        self.high = try container.decode(Double.self, forKey: .high)
        self.low = try container.decode(Double.self, forKey: .low)
        self.close = try container.decode(Double.self, forKey: .close)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.open, forKey: .open)
        try container.encode(self.high, forKey: .high)
        try container.encode(self.low, forKey: .low)
        try container.encode(self.close, forKey: .close)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case open
        case high
        case low
        case close
    }
}