import Foundation

/// Current marine data
public struct MarineWeatherResponseCurrent: Codable, Hashable, Sendable {
    /// ISO 8601 formatted timestamp
    public let timestamp: Date?
    /// Significant height of combined sea waves (m)
    public let waveHeight: Double?
    /// Direction from which the combined waves are coming (°)
    public let waveDirection: Double?
    /// Average period of combined sea waves (s)
    public let wavePeriod: Double?
    /// Height of locally generated wind waves (m)
    public let windWaveHeight: Double?
    /// Direction from which the wind waves are coming (°)
    public let windWaveDirection: Double?
    /// Average period of locally generated wind waves (s)
    public let windWavePeriod: Double?
    /// Height of swell waves (m)
    public let swellWaveHeight: Double?
    /// Direction from which the swell waves are coming (°)
    public let swellWaveDirection: Double?
    /// Average period of swell waves (s)
    public let swellWavePeriod: Double?
    /// Sea level height relative to mean sea level (m)
    public let seaLevelHeightMsl: Double?
    /// Temperature of the ocean surface (°C)
    public let seaSurfaceTemperature: Double?
    /// Speed of the ocean current (km/h)
    public let oceanCurrentVelocity: Double?
    /// Direction of the ocean current (°)
    public let oceanCurrentDirection: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        timestamp: Date? = nil,
        waveHeight: Double? = nil,
        waveDirection: Double? = nil,
        wavePeriod: Double? = nil,
        windWaveHeight: Double? = nil,
        windWaveDirection: Double? = nil,
        windWavePeriod: Double? = nil,
        swellWaveHeight: Double? = nil,
        swellWaveDirection: Double? = nil,
        swellWavePeriod: Double? = nil,
        seaLevelHeightMsl: Double? = nil,
        seaSurfaceTemperature: Double? = nil,
        oceanCurrentVelocity: Double? = nil,
        oceanCurrentDirection: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.timestamp = timestamp
        self.waveHeight = waveHeight
        self.waveDirection = waveDirection
        self.wavePeriod = wavePeriod
        self.windWaveHeight = windWaveHeight
        self.windWaveDirection = windWaveDirection
        self.windWavePeriod = windWavePeriod
        self.swellWaveHeight = swellWaveHeight
        self.swellWaveDirection = swellWaveDirection
        self.swellWavePeriod = swellWavePeriod
        self.seaLevelHeightMsl = seaLevelHeightMsl
        self.seaSurfaceTemperature = seaSurfaceTemperature
        self.oceanCurrentVelocity = oceanCurrentVelocity
        self.oceanCurrentDirection = oceanCurrentDirection
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.timestamp = try container.decodeIfPresent(Date.self, forKey: .timestamp)
        self.waveHeight = try container.decodeIfPresent(Double.self, forKey: .waveHeight)
        self.waveDirection = try container.decodeIfPresent(Double.self, forKey: .waveDirection)
        self.wavePeriod = try container.decodeIfPresent(Double.self, forKey: .wavePeriod)
        self.windWaveHeight = try container.decodeIfPresent(Double.self, forKey: .windWaveHeight)
        self.windWaveDirection = try container.decodeIfPresent(Double.self, forKey: .windWaveDirection)
        self.windWavePeriod = try container.decodeIfPresent(Double.self, forKey: .windWavePeriod)
        self.swellWaveHeight = try container.decodeIfPresent(Double.self, forKey: .swellWaveHeight)
        self.swellWaveDirection = try container.decodeIfPresent(Double.self, forKey: .swellWaveDirection)
        self.swellWavePeriod = try container.decodeIfPresent(Double.self, forKey: .swellWavePeriod)
        self.seaLevelHeightMsl = try container.decodeIfPresent(Double.self, forKey: .seaLevelHeightMsl)
        self.seaSurfaceTemperature = try container.decodeIfPresent(Double.self, forKey: .seaSurfaceTemperature)
        self.oceanCurrentVelocity = try container.decodeIfPresent(Double.self, forKey: .oceanCurrentVelocity)
        self.oceanCurrentDirection = try container.decodeIfPresent(Double.self, forKey: .oceanCurrentDirection)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.waveHeight, forKey: .waveHeight)
        try container.encodeIfPresent(self.waveDirection, forKey: .waveDirection)
        try container.encodeIfPresent(self.wavePeriod, forKey: .wavePeriod)
        try container.encodeIfPresent(self.windWaveHeight, forKey: .windWaveHeight)
        try container.encodeIfPresent(self.windWaveDirection, forKey: .windWaveDirection)
        try container.encodeIfPresent(self.windWavePeriod, forKey: .windWavePeriod)
        try container.encodeIfPresent(self.swellWaveHeight, forKey: .swellWaveHeight)
        try container.encodeIfPresent(self.swellWaveDirection, forKey: .swellWaveDirection)
        try container.encodeIfPresent(self.swellWavePeriod, forKey: .swellWavePeriod)
        try container.encodeIfPresent(self.seaLevelHeightMsl, forKey: .seaLevelHeightMsl)
        try container.encodeIfPresent(self.seaSurfaceTemperature, forKey: .seaSurfaceTemperature)
        try container.encodeIfPresent(self.oceanCurrentVelocity, forKey: .oceanCurrentVelocity)
        try container.encodeIfPresent(self.oceanCurrentDirection, forKey: .oceanCurrentDirection)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case timestamp
        case waveHeight = "wave_height"
        case waveDirection = "wave_direction"
        case wavePeriod = "wave_period"
        case windWaveHeight = "wind_wave_height"
        case windWaveDirection = "wind_wave_direction"
        case windWavePeriod = "wind_wave_period"
        case swellWaveHeight = "swell_wave_height"
        case swellWaveDirection = "swell_wave_direction"
        case swellWavePeriod = "swell_wave_period"
        case seaLevelHeightMsl = "sea_level_height_msl"
        case seaSurfaceTemperature = "sea_surface_temperature"
        case oceanCurrentVelocity = "ocean_current_velocity"
        case oceanCurrentDirection = "ocean_current_direction"
    }
}