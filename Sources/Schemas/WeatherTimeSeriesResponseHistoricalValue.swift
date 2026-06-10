import Foundation

public struct WeatherTimeSeriesResponseHistoricalValue: Codable, Hashable, Sendable {
    /// Daily historical data
    public let daily: WeatherTimeSeriesResponseHistoricalValueDaily?
    /// Hourly historical data
    public let hourly: [WeatherTimeSeriesResponseHistoricalValueHourlyItem]?
    /// Astronomy data
    public let astronomy: WeatherTimeSeriesResponseHistoricalValueAstronomy?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        daily: WeatherTimeSeriesResponseHistoricalValueDaily? = nil,
        hourly: [WeatherTimeSeriesResponseHistoricalValueHourlyItem]? = nil,
        astronomy: WeatherTimeSeriesResponseHistoricalValueAstronomy? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.daily = daily
        self.hourly = hourly
        self.astronomy = astronomy
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.daily = try container.decodeIfPresent(WeatherTimeSeriesResponseHistoricalValueDaily.self, forKey: .daily)
        self.hourly = try container.decodeIfPresent([WeatherTimeSeriesResponseHistoricalValueHourlyItem].self, forKey: .hourly)
        self.astronomy = try container.decodeIfPresent(WeatherTimeSeriesResponseHistoricalValueAstronomy.self, forKey: .astronomy)
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