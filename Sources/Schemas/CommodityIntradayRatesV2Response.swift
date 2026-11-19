import Foundation

/// Intraday response containing the prices of the requested symbol keyed by UTC timestamp.
public struct CommodityIntradayRatesV2Response: Codable, Hashable, Sendable {
    /// `true` for successful requests.
    public let success: Bool
    /// The symbol the prices belong to.
    public let symbol: String
    /// The UTC day requested. Format: `YYYY-MM-DD`.
    public let date: String
    /// The interval used, in lowercase form (`5M` comes back as `5m`).
    public let interval: CommodityIntradayRatesV2ResponseInterval
    /// First mark of the window, `HH:mm` UTC.
    public let startTime: String
    /// Number of points in `rates` (at most 100).
    public let count: Int
    /// `HH:mm` value to pass as `startTime` for the next page, or `null` when the window reached the end of the day (or the current minute, for today).
    public let nextStartTime: Nullable<String>
    /// Prices keyed by ISO 8601 UTC timestamp (for example `2026-10-14T18:00:00Z`), in ascending order. Values are rounded to two decimals. A mark with no recorded price is left out rather than filled in.
    public let rates: [String: Float]
    /// Unit and currency of the prices, keyed by the requested symbol. Omitted when the request sets `metadata=false`.
    public let metadata: [String: CommodityIntradayRatesV2ResponseMetadataValue]?
    /// Present when the symbol you sent was matched to a single alternative (200, with `resolvedTo`, for example `GOLD` answered as `XAU`), or not recognized at all (404, with a `suggestions` array when close matches exist).
    public let unresolved: [String: CommodityIntradayRatesV2ResponseUnresolvedValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        success: Bool,
        symbol: String,
        date: String,
        interval: CommodityIntradayRatesV2ResponseInterval,
        startTime: String,
        count: Int,
        nextStartTime: Nullable<String>,
        rates: [String: Float],
        metadata: [String: CommodityIntradayRatesV2ResponseMetadataValue]? = nil,
        unresolved: [String: CommodityIntradayRatesV2ResponseUnresolvedValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.success = success
        self.symbol = symbol
        self.date = date
        self.interval = interval
        self.startTime = startTime
        self.count = count
        self.nextStartTime = nextStartTime
        self.rates = rates
        self.metadata = metadata
        self.unresolved = unresolved
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.symbol = try container.decode(String.self, forKey: .symbol)
        self.date = try container.decode(String.self, forKey: .date)
        self.interval = try container.decode(CommodityIntradayRatesV2ResponseInterval.self, forKey: .interval)
        self.startTime = try container.decode(String.self, forKey: .startTime)
        self.count = try container.decode(Int.self, forKey: .count)
        self.nextStartTime = try container.decode(Nullable<String>.self, forKey: .nextStartTime)
        self.rates = try container.decode([String: Float].self, forKey: .rates)
        self.metadata = try container.decodeIfPresent([String: CommodityIntradayRatesV2ResponseMetadataValue].self, forKey: .metadata)
        self.unresolved = try container.decodeIfPresent([String: CommodityIntradayRatesV2ResponseUnresolvedValue].self, forKey: .unresolved)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.success, forKey: .success)
        try container.encode(self.symbol, forKey: .symbol)
        try container.encode(self.date, forKey: .date)
        try container.encode(self.interval, forKey: .interval)
        try container.encode(self.startTime, forKey: .startTime)
        try container.encode(self.count, forKey: .count)
        try container.encode(self.nextStartTime, forKey: .nextStartTime)
        try container.encode(self.rates, forKey: .rates)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
        try container.encodeIfPresent(self.unresolved, forKey: .unresolved)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case success
        case symbol
        case date
        case interval
        case startTime
        case count
        case nextStartTime
        case rates
        case metadata
        case unresolved
    }
}