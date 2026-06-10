import Foundation

public struct CommodityHistoricalRatesResponseRatesValue: Codable, Hashable, Sendable {
    /// Date for which commodity prices were fetched. Format: YYYY-MM-DD.
    public let date: String
    /// The opening price of the commodity on the given date.
    public let open: Double
    /// The highest price of the commodity recorded on the given date.
    public let high: Double
    /// The lowest price of the commodity recorded on the given date.
    public let low: Double
    /// The closing price of the commodity on the given date.
    public let close: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        date: String,
        open: Double,
        high: Double,
        low: Double,
        close: Double,
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
        self.open = try container.decode(Double.self, forKey: .open)
        self.high = try container.decode(Double.self, forKey: .high)
        self.low = try container.decode(Double.self, forKey: .low)
        self.close = try container.decode(Double.self, forKey: .close)
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