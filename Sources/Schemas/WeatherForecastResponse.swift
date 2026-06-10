import Foundation

public struct WeatherForecastResponse: Codable, Hashable, Sendable {
    /// Location information
    public let location: WeatherForecastResponseLocation?
    /// Forecast data object of the provided date range
    public let forecast: [String: WeatherForecastResponseForecastValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        location: WeatherForecastResponseLocation? = nil,
        forecast: [String: WeatherForecastResponseForecastValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.location = location
        self.forecast = forecast
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.location = try container.decodeIfPresent(WeatherForecastResponseLocation.self, forKey: .location)
        self.forecast = try container.decodeIfPresent([String: WeatherForecastResponseForecastValue].self, forKey: .forecast)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.forecast, forKey: .forecast)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case location
        case forecast
    }
}