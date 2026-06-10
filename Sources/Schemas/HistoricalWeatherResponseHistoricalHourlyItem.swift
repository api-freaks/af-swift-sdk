import Foundation

public struct HistoricalWeatherResponseHistoricalHourlyItem: Codable, Hashable, Sendable {
    /// ISO 8601 formatted timestamp
    public let timestamp: Date?
    /// Air temperature at 2 meters (°C)
    public let temperature2M: Double?
    /// Relative humidity at 2 meters (%)
    public let relativeHumidity2M: Double?
    /// Dew point temperature at 2 meters (°C)
    public let dewPoint2M: Double?
    /// Perceived temperature (°C)
    public let apparentTemperature: Double?
    /// Total precipitation in this hour (mm)
    public let precipitation: Double?
    /// Rainfall in this hour (mm)
    public let rain: Double?
    /// Snowfall in this hour (cm)
    public let snowfall: Double?
    /// Weather condition code
    public let weatherCode: Int?
    /// Atmospheric pressure at mean sea level (hPa)
    public let pressureMsl: Double?
    /// Atmospheric pressure at ground level (hPa)
    public let surfacePressure: Double?
    /// Cloud cover percentage (%)
    public let cloudCover: Double?
    /// Hourly reference evapotranspiration (mm)
    public let et0FaoEvapotranspiration: Double?
    /// Wind speed at 10 meters (km/h)
    public let windSpeed10M: Double?
    /// Wind direction at 10 meters (°)
    public let windDirection10M: Int?
    /// Wind gusts at 10 meters (km/h)
    public let windGusts10M: Double?
    /// Reflectivity of the Earth's surface
    public let albedo: Double?
    /// Incoming shortwave solar radiation (W/m²)
    public let shortwaveRadiation: Double?
    /// Direct solar radiation (W/m²)
    public let directRadiation: Double?
    /// Diffuse solar radiation (W/m²)
    public let diffuseRadiation: Double?
    /// Direct solar irradiance (W/m²)
    public let directNormalIrradiance: Double?
    /// Total solar irradiance on a tilted surface (W/m²)
    public let globalTiltedIrradiance: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        timestamp: Date? = nil,
        temperature2M: Double? = nil,
        relativeHumidity2M: Double? = nil,
        dewPoint2M: Double? = nil,
        apparentTemperature: Double? = nil,
        precipitation: Double? = nil,
        rain: Double? = nil,
        snowfall: Double? = nil,
        weatherCode: Int? = nil,
        pressureMsl: Double? = nil,
        surfacePressure: Double? = nil,
        cloudCover: Double? = nil,
        et0FaoEvapotranspiration: Double? = nil,
        windSpeed10M: Double? = nil,
        windDirection10M: Int? = nil,
        windGusts10M: Double? = nil,
        albedo: Double? = nil,
        shortwaveRadiation: Double? = nil,
        directRadiation: Double? = nil,
        diffuseRadiation: Double? = nil,
        directNormalIrradiance: Double? = nil,
        globalTiltedIrradiance: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.timestamp = timestamp
        self.temperature2M = temperature2M
        self.relativeHumidity2M = relativeHumidity2M
        self.dewPoint2M = dewPoint2M
        self.apparentTemperature = apparentTemperature
        self.precipitation = precipitation
        self.rain = rain
        self.snowfall = snowfall
        self.weatherCode = weatherCode
        self.pressureMsl = pressureMsl
        self.surfacePressure = surfacePressure
        self.cloudCover = cloudCover
        self.et0FaoEvapotranspiration = et0FaoEvapotranspiration
        self.windSpeed10M = windSpeed10M
        self.windDirection10M = windDirection10M
        self.windGusts10M = windGusts10M
        self.albedo = albedo
        self.shortwaveRadiation = shortwaveRadiation
        self.directRadiation = directRadiation
        self.diffuseRadiation = diffuseRadiation
        self.directNormalIrradiance = directNormalIrradiance
        self.globalTiltedIrradiance = globalTiltedIrradiance
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.timestamp = try container.decodeIfPresent(Date.self, forKey: .timestamp)
        self.temperature2M = try container.decodeIfPresent(Double.self, forKey: .temperature2M)
        self.relativeHumidity2M = try container.decodeIfPresent(Double.self, forKey: .relativeHumidity2M)
        self.dewPoint2M = try container.decodeIfPresent(Double.self, forKey: .dewPoint2M)
        self.apparentTemperature = try container.decodeIfPresent(Double.self, forKey: .apparentTemperature)
        self.precipitation = try container.decodeIfPresent(Double.self, forKey: .precipitation)
        self.rain = try container.decodeIfPresent(Double.self, forKey: .rain)
        self.snowfall = try container.decodeIfPresent(Double.self, forKey: .snowfall)
        self.weatherCode = try container.decodeIfPresent(Int.self, forKey: .weatherCode)
        self.pressureMsl = try container.decodeIfPresent(Double.self, forKey: .pressureMsl)
        self.surfacePressure = try container.decodeIfPresent(Double.self, forKey: .surfacePressure)
        self.cloudCover = try container.decodeIfPresent(Double.self, forKey: .cloudCover)
        self.et0FaoEvapotranspiration = try container.decodeIfPresent(Double.self, forKey: .et0FaoEvapotranspiration)
        self.windSpeed10M = try container.decodeIfPresent(Double.self, forKey: .windSpeed10M)
        self.windDirection10M = try container.decodeIfPresent(Int.self, forKey: .windDirection10M)
        self.windGusts10M = try container.decodeIfPresent(Double.self, forKey: .windGusts10M)
        self.albedo = try container.decodeIfPresent(Double.self, forKey: .albedo)
        self.shortwaveRadiation = try container.decodeIfPresent(Double.self, forKey: .shortwaveRadiation)
        self.directRadiation = try container.decodeIfPresent(Double.self, forKey: .directRadiation)
        self.diffuseRadiation = try container.decodeIfPresent(Double.self, forKey: .diffuseRadiation)
        self.directNormalIrradiance = try container.decodeIfPresent(Double.self, forKey: .directNormalIrradiance)
        self.globalTiltedIrradiance = try container.decodeIfPresent(Double.self, forKey: .globalTiltedIrradiance)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.temperature2M, forKey: .temperature2M)
        try container.encodeIfPresent(self.relativeHumidity2M, forKey: .relativeHumidity2M)
        try container.encodeIfPresent(self.dewPoint2M, forKey: .dewPoint2M)
        try container.encodeIfPresent(self.apparentTemperature, forKey: .apparentTemperature)
        try container.encodeIfPresent(self.precipitation, forKey: .precipitation)
        try container.encodeIfPresent(self.rain, forKey: .rain)
        try container.encodeIfPresent(self.snowfall, forKey: .snowfall)
        try container.encodeIfPresent(self.weatherCode, forKey: .weatherCode)
        try container.encodeIfPresent(self.pressureMsl, forKey: .pressureMsl)
        try container.encodeIfPresent(self.surfacePressure, forKey: .surfacePressure)
        try container.encodeIfPresent(self.cloudCover, forKey: .cloudCover)
        try container.encodeIfPresent(self.et0FaoEvapotranspiration, forKey: .et0FaoEvapotranspiration)
        try container.encodeIfPresent(self.windSpeed10M, forKey: .windSpeed10M)
        try container.encodeIfPresent(self.windDirection10M, forKey: .windDirection10M)
        try container.encodeIfPresent(self.windGusts10M, forKey: .windGusts10M)
        try container.encodeIfPresent(self.albedo, forKey: .albedo)
        try container.encodeIfPresent(self.shortwaveRadiation, forKey: .shortwaveRadiation)
        try container.encodeIfPresent(self.directRadiation, forKey: .directRadiation)
        try container.encodeIfPresent(self.diffuseRadiation, forKey: .diffuseRadiation)
        try container.encodeIfPresent(self.directNormalIrradiance, forKey: .directNormalIrradiance)
        try container.encodeIfPresent(self.globalTiltedIrradiance, forKey: .globalTiltedIrradiance)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case timestamp
        case temperature2M = "temperature_2m"
        case relativeHumidity2M = "relative_humidity_2m"
        case dewPoint2M = "dew_point_2m"
        case apparentTemperature = "apparent_temperature"
        case precipitation
        case rain
        case snowfall
        case weatherCode = "weather_code"
        case pressureMsl = "pressure_msl"
        case surfacePressure = "surface_pressure"
        case cloudCover = "cloud_cover"
        case et0FaoEvapotranspiration = "et0_fao_evapotranspiration"
        case windSpeed10M = "wind_speed_10m"
        case windDirection10M = "wind_direction_10m"
        case windGusts10M = "wind_gusts_10m"
        case albedo
        case shortwaveRadiation = "shortwave_radiation"
        case directRadiation = "direct_radiation"
        case diffuseRadiation = "diffuse_radiation"
        case directNormalIrradiance = "direct_normal_irradiance"
        case globalTiltedIrradiance = "global_tilted_irradiance"
    }
}