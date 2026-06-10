import Foundation

/// Historical data object of the provided date
public struct HistoricalWeatherResponseHistorical: Codable, Hashable, Sendable {
    /// Daily historical data
    public let daily: HistoricalWeatherResponseHistoricalDaily?
    /// Hourly historical data
    public let hourly: [HistoricalWeatherResponseHistoricalHourlyItem]?
    /// Astronomy data
    public let astronomy: HistoricalWeatherResponseHistoricalAstronomy?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        daily: HistoricalWeatherResponseHistoricalDaily? = nil,
        hourly: [HistoricalWeatherResponseHistoricalHourlyItem]? = nil,
        astronomy: HistoricalWeatherResponseHistoricalAstronomy? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.daily = daily
        self.hourly = hourly
        self.astronomy = astronomy
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.daily = try container.decodeIfPresent(HistoricalWeatherResponseHistoricalDaily.self, forKey: .daily)
        self.hourly = try container.decodeIfPresent([HistoricalWeatherResponseHistoricalHourlyItem].self, forKey: .hourly)
        self.astronomy = try container.decodeIfPresent(HistoricalWeatherResponseHistoricalAstronomy.self, forKey: .astronomy)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.daily, forKey: .daily)
        try container.encodeIfPresent(self.hourly, forKey: .hourly)
        try container.encodeIfPresent(self.astronomy, forKey: .astronomy)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case daily
        case hourly
        case astronomy
    }
}