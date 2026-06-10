import Foundation

public struct WeatherForecastResponseForecastValue: Codable, Hashable, Sendable {
    /// Daily forecast data
    public let daily: WeatherForecastResponseForecastValueDaily?
    /// Hourly forecast data
    public let hourly: [WeatherForecastResponseForecastValueHourlyItem]?
    /// Minutely forecast data
    public let minutely: [WeatherForecastResponseForecastValueMinutelyItem]?
    /// Astronomy data
    public let astronomy: WeatherForecastResponseForecastValueAstronomy?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        daily: WeatherForecastResponseForecastValueDaily? = nil,
        hourly: [WeatherForecastResponseForecastValueHourlyItem]? = nil,
        minutely: [WeatherForecastResponseForecastValueMinutelyItem]? = nil,
        astronomy: WeatherForecastResponseForecastValueAstronomy? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.daily = daily
        self.hourly = hourly
        self.minutely = minutely
        self.astronomy = astronomy
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.daily = try container.decodeIfPresent(WeatherForecastResponseForecastValueDaily.self, forKey: .daily)
        self.hourly = try container.decodeIfPresent([WeatherForecastResponseForecastValueHourlyItem].self, forKey: .hourly)
        self.minutely = try container.decodeIfPresent([WeatherForecastResponseForecastValueMinutelyItem].self, forKey: .minutely)
        self.astronomy = try container.decodeIfPresent(WeatherForecastResponseForecastValueAstronomy.self, forKey: .astronomy)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.daily, forKey: .daily)
        try container.encodeIfPresent(self.hourly, forKey: .hourly)
        try container.encodeIfPresent(self.minutely, forKey: .minutely)
        try container.encodeIfPresent(self.astronomy, forKey: .astronomy)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case daily
        case hourly
        case minutely
        case astronomy
    }
}