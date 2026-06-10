import Foundation

public struct WeatherTimeSeriesResponse: Codable, Hashable, Sendable {
    /// Location information
    public let location: WeatherTimeSeriesResponseLocation?
    /// Historical data object of the provided date range
    public let historical: [String: WeatherTimeSeriesResponseHistoricalValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        location: WeatherTimeSeriesResponseLocation? = nil,
        historical: [String: WeatherTimeSeriesResponseHistoricalValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.location = location
        self.historical = historical
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.location = try container.decodeIfPresent(WeatherTimeSeriesResponseLocation.self, forKey: .location)
        self.historical = try container.decodeIfPresent([String: WeatherTimeSeriesResponseHistoricalValue].self, forKey: .historical)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.historical, forKey: .historical)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case location
        case historical
    }
}