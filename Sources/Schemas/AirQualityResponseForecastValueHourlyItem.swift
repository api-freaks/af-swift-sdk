import Foundation

public struct AirQualityResponseForecastValueHourlyItem: Codable, Hashable, Sendable {
    /// ISO 8601 formatted timestamp
    public let timestamp: Date?
    /// Concentration of particulate matter ≤10 micrometers (μg/m³)
    public let pm10: Double?
    /// Concentration of carbon monoxide (μg/m³)
    public let carbonMonoxide: Double?
    /// Concentration of particulate matter ≤2.5 micrometers (μg/m³)
    public let pm25: Double?
    /// Concentration of carbon dioxide (ppm)
    public let carbonDioxide: Double?
    /// Concentration of nitrogen dioxide (μg/m³)
    public let nitrogenDioxide: Double?
    /// Concentration of sulphur dioxide (μg/m³)
    public let sulphurDioxide: Double?
    /// Concentration of ozone (μg/m³)
    public let ozone: Double?
    /// Concentration of dust particles (μg/m³)
    public let dust: Double?
    /// Ultraviolet radiation index
    public let uvIndex: Double?
    /// Aerosol optical depth
    public let aerosolOpticalDepth: Double?
    /// Ultraviolet radiation index under clear sky conditions
    public let uvIndexClearSky: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        timestamp: Date? = nil,
        pm10: Double? = nil,
        carbonMonoxide: Double? = nil,
        pm25: Double? = nil,
        carbonDioxide: Double? = nil,
        nitrogenDioxide: Double? = nil,
        sulphurDioxide: Double? = nil,
        ozone: Double? = nil,
        dust: Double? = nil,
        uvIndex: Double? = nil,
        aerosolOpticalDepth: Double? = nil,
        uvIndexClearSky: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.timestamp = timestamp
        self.pm10 = pm10
        self.carbonMonoxide = carbonMonoxide
        self.pm25 = pm25
        self.carbonDioxide = carbonDioxide
        self.nitrogenDioxide = nitrogenDioxide
        self.sulphurDioxide = sulphurDioxide
        self.ozone = ozone
        self.dust = dust
        self.uvIndex = uvIndex
        self.aerosolOpticalDepth = aerosolOpticalDepth
        self.uvIndexClearSky = uvIndexClearSky
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.timestamp = try container.decodeIfPresent(Date.self, forKey: .timestamp)
        self.pm10 = try container.decodeIfPresent(Double.self, forKey: .pm10)
        self.carbonMonoxide = try container.decodeIfPresent(Double.self, forKey: .carbonMonoxide)
        self.pm25 = try container.decodeIfPresent(Double.self, forKey: .pm25)
        self.carbonDioxide = try container.decodeIfPresent(Double.self, forKey: .carbonDioxide)
        self.nitrogenDioxide = try container.decodeIfPresent(Double.self, forKey: .nitrogenDioxide)
        self.sulphurDioxide = try container.decodeIfPresent(Double.self, forKey: .sulphurDioxide)
        self.ozone = try container.decodeIfPresent(Double.self, forKey: .ozone)
        self.dust = try container.decodeIfPresent(Double.self, forKey: .dust)
        self.uvIndex = try container.decodeIfPresent(Double.self, forKey: .uvIndex)
        self.aerosolOpticalDepth = try container.decodeIfPresent(Double.self, forKey: .aerosolOpticalDepth)
        self.uvIndexClearSky = try container.decodeIfPresent(Double.self, forKey: .uvIndexClearSky)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.pm10, forKey: .pm10)
        try container.encodeIfPresent(self.carbonMonoxide, forKey: .carbonMonoxide)
        try container.encodeIfPresent(self.pm25, forKey: .pm25)
        try container.encodeIfPresent(self.carbonDioxide, forKey: .carbonDioxide)
        try container.encodeIfPresent(self.nitrogenDioxide, forKey: .nitrogenDioxide)
        try container.encodeIfPresent(self.sulphurDioxide, forKey: .sulphurDioxide)
        try container.encodeIfPresent(self.ozone, forKey: .ozone)
        try container.encodeIfPresent(self.dust, forKey: .dust)
        try container.encodeIfPresent(self.uvIndex, forKey: .uvIndex)
        try container.encodeIfPresent(self.aerosolOpticalDepth, forKey: .aerosolOpticalDepth)
        try container.encodeIfPresent(self.uvIndexClearSky, forKey: .uvIndexClearSky)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case timestamp
        case pm10
        case carbonMonoxide = "carbon_monoxide"
        case pm25 = "pm2_5"
        case carbonDioxide = "carbon_dioxide"
        case nitrogenDioxide = "nitrogen_dioxide"
        case sulphurDioxide = "sulphur_dioxide"
        case ozone
        case dust
        case uvIndex = "uv_index"
        case aerosolOpticalDepth = "aerosol_optical_depth"
        case uvIndexClearSky = "uv_index_clear_sky"
    }
}