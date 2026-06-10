import Foundation

public struct FloodForecastResponseForecastValue: Codable, Hashable, Sendable {
    /// Daily flood forecast data for the date.
    public let daily: FloodForecastResponseForecastValueDaily?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        daily: FloodForecastResponseForecastValueDaily? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.daily = daily
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.daily = try container.decodeIfPresent(FloodForecastResponseForecastValueDaily.self, forKey: .daily)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.daily, forKey: .daily)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case daily
    }
}