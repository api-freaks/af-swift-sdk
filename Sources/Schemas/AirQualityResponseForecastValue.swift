import Foundation

public struct AirQualityResponseForecastValue: Codable, Hashable, Sendable {
    /// Hourly air quality forecast data
    public let hourly: [AirQualityResponseForecastValueHourlyItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        hourly: [AirQualityResponseForecastValueHourlyItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.hourly = hourly
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hourly = try container.decodeIfPresent([AirQualityResponseForecastValueHourlyItem].self, forKey: .hourly)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.hourly, forKey: .hourly)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case hourly
    }
}