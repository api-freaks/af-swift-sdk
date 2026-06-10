import Foundation

public struct CurrentWeatherResponse: Codable, Hashable, Sendable {
    /// Location information
    public let location: CurrentWeatherResponseLocation
    /// Current weather data
    public let current: CurrentWeatherResponseCurrent
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        location: CurrentWeatherResponseLocation,
        current: CurrentWeatherResponseCurrent,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.location = location
        self.current = current
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.location = try container.decode(CurrentWeatherResponseLocation.self, forKey: .location)
        self.current = try container.decode(CurrentWeatherResponseCurrent.self, forKey: .current)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.location, forKey: .location)
        try container.encode(self.current, forKey: .current)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case location
        case current
    }
}