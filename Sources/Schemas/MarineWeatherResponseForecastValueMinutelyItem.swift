import Foundation

public struct MarineWeatherResponseForecastValueMinutelyItem: Codable, Hashable, Sendable {
    /// ISO 8601 formatted timestamp
    public let timestamp: Date?
    /// Speed of ocean current (km/h)
    public let oceanCurrentVelocity: Double?
    /// Direction of ocean current (°)
    public let oceanCurrentDirection: Int?
    /// Sea level height relative to mean sea level (m)
    public let seaLevelHeightMsl: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        timestamp: Date? = nil,
        oceanCurrentVelocity: Double? = nil,
        oceanCurrentDirection: Int? = nil,
        seaLevelHeightMsl: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.timestamp = timestamp
        self.oceanCurrentVelocity = oceanCurrentVelocity
        self.oceanCurrentDirection = oceanCurrentDirection
        self.seaLevelHeightMsl = seaLevelHeightMsl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.timestamp = try container.decodeIfPresent(Date.self, forKey: .timestamp)
        self.oceanCurrentVelocity = try container.decodeIfPresent(Double.self, forKey: .oceanCurrentVelocity)
        self.oceanCurrentDirection = try container.decodeIfPresent(Int.self, forKey: .oceanCurrentDirection)
        self.seaLevelHeightMsl = try container.decodeIfPresent(Double.self, forKey: .seaLevelHeightMsl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.oceanCurrentVelocity, forKey: .oceanCurrentVelocity)
        try container.encodeIfPresent(self.oceanCurrentDirection, forKey: .oceanCurrentDirection)
        try container.encodeIfPresent(self.seaLevelHeightMsl, forKey: .seaLevelHeightMsl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case timestamp
        case oceanCurrentVelocity = "ocean_current_velocity"
        case oceanCurrentDirection = "ocean_current_direction"
        case seaLevelHeightMsl = "sea_level_height_msl"
    }
}