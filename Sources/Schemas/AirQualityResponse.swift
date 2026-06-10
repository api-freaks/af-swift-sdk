import Foundation

public struct AirQualityResponse: Codable, Hashable, Sendable {
    /// Location information
    public let location: AirQualityResponseLocation?
    /// Current air quality data
    public let current: AirQualityResponseCurrent?
    /// Air quality forecast data object
    public let forecast: [String: AirQualityResponseForecastValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        location: AirQualityResponseLocation? = nil,
        current: AirQualityResponseCurrent? = nil,
        forecast: [String: AirQualityResponseForecastValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.location = location
        self.current = current
        self.forecast = forecast
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.location = try container.decodeIfPresent(AirQualityResponseLocation.self, forKey: .location)
        self.current = try container.decodeIfPresent(AirQualityResponseCurrent.self, forKey: .current)
        self.forecast = try container.decodeIfPresent([String: AirQualityResponseForecastValue].self, forKey: .forecast)
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