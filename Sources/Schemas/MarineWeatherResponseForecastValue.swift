import Foundation

public struct MarineWeatherResponseForecastValue: Codable, Hashable, Sendable {
    /// Daily marine forecast data
    public let daily: MarineWeatherResponseForecastValueDaily?
    /// Hourly marine forecast data
    public let hourly: [MarineWeatherResponseForecastValueHourlyItem]?
    /// Minutely marine forecast data
    public let minutely: [MarineWeatherResponseForecastValueMinutelyItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        daily: MarineWeatherResponseForecastValueDaily? = nil,
        hourly: [MarineWeatherResponseForecastValueHourlyItem]? = nil,
        minutely: [MarineWeatherResponseForecastValueMinutelyItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.daily = daily
        self.hourly = hourly
        self.minutely = minutely
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.daily = try container.decodeIfPresent(MarineWeatherResponseForecastValueDaily.self, forKey: .daily)
        self.hourly = try container.decodeIfPresent([MarineWeatherResponseForecastValueHourlyItem].self, forKey: .hourly)
        self.minutely = try container.decodeIfPresent([MarineWeatherResponseForecastValueMinutelyItem].self, forKey: .minutely)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.daily, forKey: .daily)
        try container.encodeIfPresent(self.hourly, forKey: .hourly)
        try container.encodeIfPresent(self.minutely, forKey: .minutely)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case daily
        case hourly
        case minutely
    }
}