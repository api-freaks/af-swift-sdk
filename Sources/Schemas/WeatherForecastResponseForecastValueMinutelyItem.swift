import Foundation

public struct WeatherForecastResponseForecastValueMinutelyItem: Codable, Hashable, Sendable {
    /// ISO 8601 formatted timestamp
    public let timestamp: Date?
    /// Air temperature at 2m (°C)
    public let temperature2M: Double?
    /// Relative humidity at 2m (%)
    public let relativeHumidity2M: Int?
    /// Dew point at 2m (°C)
    public let dewPoint2M: Double?
    /// Feels-like temperature (°C)
    public let apparentTemperature: Double?
    /// Precipitation at this minute (mm)
    public let precipitation: Double?
    /// Rainfall (mm)
    public let rain: Double?
    /// Snowfall (cm)
    public let snowfall: Double?
    /// Weather condition code
    public let weatherCode: Int?
    /// Wind speed at 10m (km/h)
    public let windSpeed10M: Double?
    /// Wind direction at 10m (°)
    public let windDirection10M: Int?
    /// Wind gusts at 10m (km/h)
    public let windGusts10M: Double?
    /// Visibility distance (m)
    public let visibility: Double?
    /// Shortwave radiation (W/m²)
    public let shortwaveRadiation: Double?
    /// Direct solar radiation (W/m²)
    public let directRadiation: Double?
    /// Diffuse solar radiation (W/m²)
    public let diffuseRadiation: Double?
    /// Direct normal irradiance (W/m²)
    public let directNormalIrradiance: Double?
    /// Global tilted irradiance (W/m²)
    public let globalTiltedIrradiance: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        timestamp: Date? = nil,
        temperature2M: Double? = nil,
        relativeHumidity2M: Int? = nil,
        dewPoint2M: Double? = nil,
        apparentTemperature: Double? = nil,
        precipitation: Double? = nil,
        rain: Double? = nil,
        snowfall: Double? = nil,
        weatherCode: Int? = nil,
        windSpeed10M: Double? = nil,
        windDirection10M: Int? = nil,
        windGusts10M: Double? = nil,
        visibility: Double? = nil,
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
        self.windSpeed10M = windSpeed10M
        self.windDirection10M = windDirection10M
        self.windGusts10M = windGusts10M
        self.visibility = visibility
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
        self.relativeHumidity2M = try container.decodeIfPresent(Int.self, forKey: .relativeHumidity2M)
        self.dewPoint2M = try container.decodeIfPresent(Double.self, forKey: .dewPoint2M)
        self.apparentTemperature = try container.decodeIfPresent(Double.self, forKey: .apparentTemperature)
        self.precipitation = try container.decodeIfPresent(Double.self, forKey: .precipitation)
        self.rain = try container.decodeIfPresent(Double.self, forKey: .rain)
        self.snowfall = try container.decodeIfPresent(Double.self, forKey: .snowfall)
        self.weatherCode = try container.decodeIfPresent(Int.self, forKey: .weatherCode)
        self.windSpeed10M = try container.decodeIfPresent(Double.self, forKey: .windSpeed10M)
        self.windDirection10M = try container.decodeIfPresent(Int.self, forKey: .windDirection10M)
        self.windGusts10M = try container.decodeIfPresent(Double.self, forKey: .windGusts10M)
        self.visibility = try container.decodeIfPresent(Double.self, forKey: .visibility)
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
        try container.encodeIfPresent(self.windSpeed10M, forKey: .windSpeed10M)
        try container.encodeIfPresent(self.windDirection10M, forKey: .windDirection10M)
        try container.encodeIfPresent(self.windGusts10M, forKey: .windGusts10M)
        try container.encodeIfPresent(self.visibility, forKey: .visibility)
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
        case windSpeed10M = "wind_speed_10m"
        case windDirection10M = "wind_direction_10m"
        case windGusts10M = "wind_gusts_10m"
        case visibility
        case shortwaveRadiation = "shortwave_radiation"
        case directRadiation = "direct_radiation"
        case diffuseRadiation = "diffuse_radiation"
        case directNormalIrradiance = "direct_normal_irradiance"
        case globalTiltedIrradiance = "global_tilted_irradiance"
    }
}