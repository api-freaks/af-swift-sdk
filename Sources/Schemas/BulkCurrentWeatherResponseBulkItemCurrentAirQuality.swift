import Foundation

/// Air quality metrics including pollutant concentrations and AQI values.
public struct BulkCurrentWeatherResponseBulkItemCurrentAirQuality: Codable, Hashable, Sendable {
    /// ISO 8601 formatted timestamp (iso8601).
    public let timestamp: Date
    /// Consolidated European Air Quality Index representing the highest value among individual pollutant indices. Ranges: 0-20 (good), 20-40 (fair), 40-60 (moderate), 60-80 (poor), 80-100 (very poor), >100 (extremely poor).
    public let europeanAqi: Int
    /// Consolidated U.S. Air Quality Index representing the highest value among individual pollutant indices. Ranges: 0-50 (good), 51-100 (moderate), 101-150 (unhealthy for sensitive groups), 151-200 (unhealthy), 201-300 (very unhealthy), 301-500 (hazardous).
    public let usAqi: Int
    /// Particulate matter with diameter less than 10 micrometers (μg/m³) measured at 10 meters above ground.
    public let pm10: Float
    /// Particulate matter with diameter less than 2.5 micrometers (μg/m³) measured at 10 meters above ground.
    public let pm25: Float
    /// Atmospheric carbon monoxide gas concentration (μg/m³) at 10 meters above ground.
    public let carbonMonoxide: Float
    /// Atmospheric nitrogen dioxide gas concentration (μg/m³) at 10 meters above ground.
    public let nitrogenDioxide: Float
    /// Atmospheric sulphur dioxide gas concentration (μg/m³) at 10 meters above ground.
    public let sulphurDioxide: Float
    /// Atmospheric ozone gas concentration (μg/m³) at 10 meters above ground.
    public let ozone: Float
    /// Saharan dust particle concentration (μg/m³) at 10 meters above ground.
    public let dust: Float
    /// Ultraviolet radiation intensity index accounting for cloud coverage.
    public let uvIndex: Float
    /// Aerosol optical depth at 550 nm wavelength indicating atmospheric haze levels.
    public let aerosolOpticalDepth: Float
    /// Ultraviolet radiation intensity index assuming cloud-free conditions.
    public let uvIndexClearSky: Float
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        timestamp: Date,
        europeanAqi: Int,
        usAqi: Int,
        pm10: Float,
        pm25: Float,
        carbonMonoxide: Float,
        nitrogenDioxide: Float,
        sulphurDioxide: Float,
        ozone: Float,
        dust: Float,
        uvIndex: Float,
        aerosolOpticalDepth: Float,
        uvIndexClearSky: Float,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.timestamp = timestamp
        self.europeanAqi = europeanAqi
        self.usAqi = usAqi
        self.pm10 = pm10
        self.pm25 = pm25
        self.carbonMonoxide = carbonMonoxide
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
        self.timestamp = try container.decode(Date.self, forKey: .timestamp)
        self.europeanAqi = try container.decode(Int.self, forKey: .europeanAqi)
        self.usAqi = try container.decode(Int.self, forKey: .usAqi)
        self.pm10 = try container.decode(Float.self, forKey: .pm10)
        self.pm25 = try container.decode(Float.self, forKey: .pm25)
        self.carbonMonoxide = try container.decode(Float.self, forKey: .carbonMonoxide)
        self.nitrogenDioxide = try container.decode(Float.self, forKey: .nitrogenDioxide)
        self.sulphurDioxide = try container.decode(Float.self, forKey: .sulphurDioxide)
        self.ozone = try container.decode(Float.self, forKey: .ozone)
        self.dust = try container.decode(Float.self, forKey: .dust)
        self.uvIndex = try container.decode(Float.self, forKey: .uvIndex)
        self.aerosolOpticalDepth = try container.decode(Float.self, forKey: .aerosolOpticalDepth)
        self.uvIndexClearSky = try container.decode(Float.self, forKey: .uvIndexClearSky)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.timestamp, forKey: .timestamp)
        try container.encode(self.europeanAqi, forKey: .europeanAqi)
        try container.encode(self.usAqi, forKey: .usAqi)
        try container.encode(self.pm10, forKey: .pm10)
        try container.encode(self.pm25, forKey: .pm25)
        try container.encode(self.carbonMonoxide, forKey: .carbonMonoxide)
        try container.encode(self.nitrogenDioxide, forKey: .nitrogenDioxide)
        try container.encode(self.sulphurDioxide, forKey: .sulphurDioxide)
        try container.encode(self.ozone, forKey: .ozone)
        try container.encode(self.dust, forKey: .dust)
        try container.encode(self.uvIndex, forKey: .uvIndex)
        try container.encode(self.aerosolOpticalDepth, forKey: .aerosolOpticalDepth)
        try container.encode(self.uvIndexClearSky, forKey: .uvIndexClearSky)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case timestamp
        case europeanAqi = "european_aqi"
        case usAqi = "us_aqi"
        case pm10
        case pm25 = "pm2_5"
        case carbonMonoxide = "carbon_monoxide"
        case nitrogenDioxide = "nitrogen_dioxide"
        case sulphurDioxide = "sulphur_dioxide"
        case ozone
        case dust
        case uvIndex = "uv_index"
        case aerosolOpticalDepth = "aerosol_optical_depth"
        case uvIndexClearSky = "uv_index_clear_sky"
    }
}