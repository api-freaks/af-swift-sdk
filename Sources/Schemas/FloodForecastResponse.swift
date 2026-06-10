import Foundation

public struct FloodForecastResponse: Codable, Hashable, Sendable {
    /// Location information
    public let location: FloodForecastResponseLocation?
    /// Flood forecast data object
    public let forecast: [String: FloodForecastResponseForecastValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        location: FloodForecastResponseLocation? = nil,
        forecast: [String: FloodForecastResponseForecastValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.location = location
        self.forecast = forecast
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.location = try container.decodeIfPresent(FloodForecastResponseLocation.self, forKey: .location)
        self.forecast = try container.decodeIfPresent([String: FloodForecastResponseForecastValue].self, forKey: .forecast)
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