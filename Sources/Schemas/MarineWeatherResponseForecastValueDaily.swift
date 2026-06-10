import Foundation

/// Daily marine forecast data
public struct MarineWeatherResponseForecastValueDaily: Codable, Hashable, Sendable {
    /// ISO 8601 formatted timestamp
    public let timestamp: Date?
    /// Maximum significant wave height (m)
    public let waveHeightMax: Double?
    /// Dominant direction of waves (°)
    public let waveDirectionDominant: Int?
    /// Maximum wave period (s)
    public let wavePeriodMax: Double?
    /// Maximum wind-driven wave height (m)
    public let windWaveHeightMax: Double?
    /// Dominant wind-wave direction (°)
    public let windWaveDirectionDominant: Int?
    /// Maximum wind-wave period (s)
    public let windWavePeriodMax: Double?
    /// Maximum peak period of wind-driven waves (s)
    public let windWavePeakPeriodMax: Double?
    /// Maximum swell wave height (m)
    public let swellWaveHeightMax: Double?
    /// Dominant swell wave direction (°)
    public let swellWaveDirectionDominant: Int?
    /// Maximum swell wave period (s)
    public let swellWavePeriodMax: Double?
    /// Maximum peak period of swell waves (s)
    public let swellWavePeakPeriodMax: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        timestamp: Date? = nil,
        waveHeightMax: Double? = nil,
        waveDirectionDominant: Int? = nil,
        wavePeriodMax: Double? = nil,
        windWaveHeightMax: Double? = nil,
        windWaveDirectionDominant: Int? = nil,
        windWavePeriodMax: Double? = nil,
        windWavePeakPeriodMax: Double? = nil,
        swellWaveHeightMax: Double? = nil,
        swellWaveDirectionDominant: Int? = nil,
        swellWavePeriodMax: Double? = nil,
        swellWavePeakPeriodMax: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.timestamp = timestamp
        self.waveHeightMax = waveHeightMax
        self.waveDirectionDominant = waveDirectionDominant
        self.wavePeriodMax = wavePeriodMax
        self.windWaveHeightMax = windWaveHeightMax
        self.windWaveDirectionDominant = windWaveDirectionDominant
        self.windWavePeriodMax = windWavePeriodMax
        self.windWavePeakPeriodMax = windWavePeakPeriodMax
        self.swellWaveHeightMax = swellWaveHeightMax
        self.swellWaveDirectionDominant = swellWaveDirectionDominant
        self.swellWavePeriodMax = swellWavePeriodMax
        self.swellWavePeakPeriodMax = swellWavePeakPeriodMax
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.timestamp = try container.decodeIfPresent(Date.self, forKey: .timestamp)
        self.waveHeightMax = try container.decodeIfPresent(Double.self, forKey: .waveHeightMax)
        self.waveDirectionDominant = try container.decodeIfPresent(Int.self, forKey: .waveDirectionDominant)
        self.wavePeriodMax = try container.decodeIfPresent(Double.self, forKey: .wavePeriodMax)
        self.windWaveHeightMax = try container.decodeIfPresent(Double.self, forKey: .windWaveHeightMax)
        self.windWaveDirectionDominant = try container.decodeIfPresent(Int.self, forKey: .windWaveDirectionDominant)
        self.windWavePeriodMax = try container.decodeIfPresent(Double.self, forKey: .windWavePeriodMax)
        self.windWavePeakPeriodMax = try container.decodeIfPresent(Double.self, forKey: .windWavePeakPeriodMax)
        self.swellWaveHeightMax = try container.decodeIfPresent(Double.self, forKey: .swellWaveHeightMax)
        self.swellWaveDirectionDominant = try container.decodeIfPresent(Int.self, forKey: .swellWaveDirectionDominant)
        self.swellWavePeriodMax = try container.decodeIfPresent(Double.self, forKey: .swellWavePeriodMax)
        self.swellWavePeakPeriodMax = try container.decodeIfPresent(Double.self, forKey: .swellWavePeakPeriodMax)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.waveHeightMax, forKey: .waveHeightMax)
        try container.encodeIfPresent(self.waveDirectionDominant, forKey: .waveDirectionDominant)
        try container.encodeIfPresent(self.wavePeriodMax, forKey: .wavePeriodMax)
        try container.encodeIfPresent(self.windWaveHeightMax, forKey: .windWaveHeightMax)
        try container.encodeIfPresent(self.windWaveDirectionDominant, forKey: .windWaveDirectionDominant)
        try container.encodeIfPresent(self.windWavePeriodMax, forKey: .windWavePeriodMax)
        try container.encodeIfPresent(self.windWavePeakPeriodMax, forKey: .windWavePeakPeriodMax)
        try container.encodeIfPresent(self.swellWaveHeightMax, forKey: .swellWaveHeightMax)
        try container.encodeIfPresent(self.swellWaveDirectionDominant, forKey: .swellWaveDirectionDominant)
        try container.encodeIfPresent(self.swellWavePeriodMax, forKey: .swellWavePeriodMax)
        try container.encodeIfPresent(self.swellWavePeakPeriodMax, forKey: .swellWavePeakPeriodMax)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case timestamp
        case waveHeightMax = "wave_height_max"
        case waveDirectionDominant = "wave_direction_dominant"
        case wavePeriodMax = "wave_period_max"
        case windWaveHeightMax = "wind_wave_height_max"
        case windWaveDirectionDominant = "wind_wave_direction_dominant"
        case windWavePeriodMax = "wind_wave_period_max"
        case windWavePeakPeriodMax = "wind_wave_peak_period_max"
        case swellWaveHeightMax = "swell_wave_height_max"
        case swellWaveDirectionDominant = "swell_wave_direction_dominant"
        case swellWavePeriodMax = "swell_wave_period_max"
        case swellWavePeakPeriodMax = "swell_wave_peak_period_max"
    }
}