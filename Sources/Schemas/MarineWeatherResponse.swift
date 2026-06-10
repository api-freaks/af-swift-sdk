import Foundation

public struct MarineWeatherResponse: Codable, Hashable, Sendable {
    /// Location information
    public let location: MarineWeatherResponseLocation?
    /// Current marine data
    public let current: MarineWeatherResponseCurrent?
    /// Marine forecast data object keyed by date in YYYY-MM-DD format
    public let forecast: [String: MarineWeatherResponseForecastValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        location: MarineWeatherResponseLocation? = nil,
        current: MarineWeatherResponseCurrent? = nil,
        forecast: [String: MarineWeatherResponseForecastValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.location = location
        self.current = current
        self.forecast = forecast
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.location = try container.decodeIfPresent(MarineWeatherResponseLocation.self, forKey: .location)
        self.current = try container.decodeIfPresent(MarineWeatherResponseCurrent.self, forKey: .current)
        self.forecast = try container.decodeIfPresent([String: MarineWeatherResponseForecastValue].self, forKey: .forecast)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.current, forKey: .current)
        try container.encodeIfPresent(self.forecast, forKey: .forecast)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case location
        case current
        case forecast
    }
}