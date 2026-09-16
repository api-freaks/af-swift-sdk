import Foundation

public struct CommodityHistoricalRatesV2ResponseRatesValue: Codable, Hashable, Sendable {
    /// Date for which prices were fetched (YYYY-MM-DD). May differ from the requested date when the API falls back to the last available rate before it, or snaps to the first day of the month for monthly-updated commodities.
    public let date: String
    /// Opening price on the given date. 0 for monthly-updated commodities.
    public let open: Float
    /// Highest price recorded on the given date. 0 for monthly-updated commodities.
    public let high: Float
    /// Lowest price recorded on the given date. 0 for monthly-updated commodities.
    public let low: Float
    /// Closing price on the given date.
    public let close: Float
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        date: String,
        open: Float,
        high: Float,
        low: Float,
        close: Float,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.date = date
        self.open = open
        self.high = high
        self.low = low
        self.close = close
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decode(String.self, forKey: .date)
        self.open = try container.decode(Float.self, forKey: .open)
        self.high = try container.decode(Float.self, forKey: .high)
        self.low = try container.decode(Float.self, forKey: .low)
        self.close = try container.decode(Float.self, forKey: .close)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.date, forKey: .date)
        try container.encode(self.open, forKey: .open)
        try container.encode(self.high, forKey: .high)
        try container.encode(self.low, forKey: .low)
        try container.encode(self.close, forKey: .close)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case date
        case open
        case high
        case low
        case close
    }
}