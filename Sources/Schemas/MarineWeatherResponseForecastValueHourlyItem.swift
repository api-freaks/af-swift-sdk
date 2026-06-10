import Foundation

public struct MarineWeatherResponseForecastValueHourlyItem: Codable, Hashable, Sendable {
    /// ISO 8601 formatted timestamp
    public let timestamp: Date?
    /// Significant wave height at the given time (m)
    public let waveHeight: Double?
    /// Wave direction (°)
    public let waveDirection: Int?
    /// Wave period at the given time (s)
    public let wavePeriod: Double?
    /// Wind-driven wave height at the given time (m)
    public let windWaveHeight: Double?
    /// Peak period of wind-driven waves (s)
    public let windWavePeakPeriod: Double?
    /// Wind-wave direction (°)
    public let windWaveDirection: Int?
    /// Wind-wave period (s)
    public let windWavePeriod: Double?
    /// Swell wave height at the given time (m)
    public let swellWaveHeight: Double?
    /// Swell wave direction (°)
    public let swellWaveDirection: Int?
    /// Swell wave period (s)
    public let swellWavePeriod: Double?
    /// Peak period of swell waves (s)
    public let swellWavePeakPeriod: Double?
    /// Sea surface temperature (°C)
    public let seaSurfaceTemperature: Double?
    /// Sea level height relative to mean sea level (m)
    public let seaLevelHeightMsl: Double?
    /// Speed of ocean current (km/h)
    public let oceanCurrentVelocity: Double?
    /// Direction of ocean current (°)
    public let oceanCurrentDirection: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        timestamp: Date? = nil,
        waveHeight: Double? = nil,
        waveDirection: Int? = nil,
        wavePeriod: Double? = nil,
        windWaveHeight: Double? = nil,
        windWavePeakPeriod: Double? = nil,
        windWaveDirection: Int? = nil,
        windWavePeriod: Double? = nil,
        swellWaveHeight: Double? = nil,
        swellWaveDirection: Int? = nil,
        swellWavePeriod: Double? = nil,
        swellWavePeakPeriod: Double? = nil,
        seaSurfaceTemperature: Double? = nil,
        seaLevelHeightMsl: Double? = nil,
        oceanCurrentVelocity: Double? = nil,
        oceanCurrentDirection: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.timestamp = timestamp
        self.waveHeight = waveHeight
        self.waveDirection = waveDirection
        self.wavePeriod = wavePeriod
        self.windWaveHeight = windWaveHeight
        self.windWavePeakPeriod = windWavePeakPeriod
        self.windWaveDirection = windWaveDirection
        self.windWavePeriod = windWavePeriod
        self.swellWaveHeight = swellWaveHeight
        self.swellWaveDirection = swellWaveDirection
        self.swellWavePeriod = swellWavePeriod
        self.swellWavePeakPeriod = swellWavePeakPeriod
        self.seaSurfaceTemperature = seaSurfaceTemperature
        self.seaLevelHeightMsl = seaLevelHeightMsl
        self.oceanCurrentVelocity = oceanCurrentVelocity
        self.oceanCurrentDirection = oceanCurrentDirection
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.timestamp = try container.decodeIfPresent(Date.self, forKey: .timestamp)
        self.waveHeight = try container.decodeIfPresent(Double.self, forKey: .waveHeight)
        self.waveDirection = try container.decodeIfPresent(Int.self, forKey: .waveDirection)
        self.wavePeriod = try container.decodeIfPresent(Double.self, forKey: .wavePeriod)
        self.windWaveHeight = try container.decodeIfPresent(Double.self, forKey: .windWaveHeight)
        self.windWavePeakPeriod = try container.decodeIfPresent(Double.self, forKey: .windWavePeakPeriod)
        self.windWaveDirection = try container.decodeIfPresent(Int.self, forKey: .windWaveDirection)
        self.windWavePeriod = try container.decodeIfPresent(Double.self, forKey: .windWavePeriod)
        self.swellWaveHeight = try container.decodeIfPresent(Double.self, forKey: .swellWaveHeight)
        self.swellWaveDirection = try container.decodeIfPresent(Int.self, forKey: .swellWaveDirection)
        self.swellWavePeriod = try container.decodeIfPresent(Double.self, forKey: .swellWavePeriod)
        self.swellWavePeakPeriod = try container.decodeIfPresent(Double.self, forKey: .swellWavePeakPeriod)
        self.seaSurfaceTemperature = try container.decodeIfPresent(Double.self, forKey: .seaSurfaceTemperature)
        self.seaLevelHeightMsl = try container.decodeIfPresent(Double.self, forKey: .seaLevelHeightMsl)
        self.oceanCurrentVelocity = try container.decodeIfPresent(Double.self, forKey: .oceanCurrentVelocity)
        self.oceanCurrentDirection = try container.decodeIfPresent(Int.self, forKey: .oceanCurrentDirection)
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
        try container.encodeIfPresent(self.windWavePeakPeriod, forKey: .windWavePeakPeriod)
        try container.encodeIfPresent(self.windWaveDirection, forKey: .windWaveDirection)
        try container.encodeIfPresent(self.windWavePeriod, forKey: .windWavePeriod)
        try container.encodeIfPresent(self.swellWaveHeight, forKey: .swellWaveHeight)
        try container.encodeIfPresent(self.swellWaveDirection, forKey: .swellWaveDirection)
        try container.encodeIfPresent(self.swellWavePeriod, forKey: .swellWavePeriod)
        try container.encodeIfPresent(self.swellWavePeakPeriod, forKey: .swellWavePeakPeriod)
        try container.encodeIfPresent(self.seaSurfaceTemperature, forKey: .seaSurfaceTemperature)
        try container.encodeIfPresent(self.seaLevelHeightMsl, forKey: .seaLevelHeightMsl)
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
        case windWavePeakPeriod = "wind_wave_peak_period"
        case windWaveDirection = "wind_wave_direction"
        case windWavePeriod = "wind_wave_period"
        case swellWaveHeight = "swell_wave_height"
        case swellWaveDirection = "swell_wave_direction"
        case swellWavePeriod = "swell_wave_period"
        case swellWavePeakPeriod = "swell_wave_peak_period"
        case seaSurfaceTemperature = "sea_surface_temperature"
        case seaLevelHeightMsl = "sea_level_height_msl"
        case oceanCurrentVelocity = "ocean_current_velocity"
        case oceanCurrentDirection = "ocean_current_direction"
    }
}