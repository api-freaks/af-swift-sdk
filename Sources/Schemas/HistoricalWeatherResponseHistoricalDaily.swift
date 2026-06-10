import Foundation

/// Daily historical data
public struct HistoricalWeatherResponseHistoricalDaily: Codable, Hashable, Sendable {
    /// ISO 8601 formatted timestamp
    public let timestamp: Date?
    /// Weather condition code
    public let weatherCode: Int?
    /// Daily mean air temperature at 2 meters (°C)
    public let temperature2MMean: Double?
    /// Daily maximum air temperature at 2 meters (°C)
    public let temperature2MMax: Double?
    /// Daily minimum air temperature at 2 meters (°C)
    public let temperature2MMin: Double?
    /// Daily mean perceived temperature (°C)
    public let apparentTemperatureMean: Double?
    /// Daily maximum perceived temperature (°C)
    public let apparentTemperatureMax: Double?
    /// Daily minimum perceived temperature (°C)
    public let apparentTemperatureMin: Double?
    /// Total precipitation (mm)
    public let precipitationSum: Double?
    /// Total rainfall (mm)
    public let rainSum: Double?
    /// Total snowfall (cm)
    public let snowfallSum: Double?
    /// Maximum wind speed at 10 meters (km/h)
    public let windSpeed10MMax: Double?
    /// Maximum wind gusts at 10 meters (km/h)
    public let windGusts10MMax: Double?
    /// Daily mean wind speed at 10 meters (km/h)
    public let windSpeed10MMean: Double?
    /// Minimum wind speed at 10 meters (km/h)
    public let windSpeed10MMin: Double?
    /// Minimum wind gusts at 10 meters (km/h)
    public let windGusts10MMin: Double?
    /// Daily mean wind gusts at 10 meters (km/h)
    public let windGusts10MMean: Double?
    /// Dominant wind direction at 10 meters (°)
    public let windDirection10MDominant: Int?
    /// Daily sum of shortwave solar radiation (MJ/m²)
    public let shortwaveRadiationSum: Double?
    /// Daily sum of reference evapotranspiration (mm)
    public let et0FaoEvapotranspirationSum: Double?
    /// Daily mean cloud cover percentage (%)
    public let cloudCoverMean: Double?
    /// Daily mean dew point temperature at 2 meters (°C)
    public let dewPoint2MMean: Double?
    /// Daily maximum dew point temperature at 2 meters (°C)
    public let dewPoint2MMax: Double?
    /// Daily minimum dew point temperature at 2 meters (°C)
    public let dewPoint2MMin: Double?
    /// Daily mean relative humidity at 2 meters (%)
    public let relativeHumidity2MMean: Double?
    /// Daily maximum relative humidity at 2 meters (%)
    public let relativeHumidity2MMax: Int?
    /// Daily minimum relative humidity at 2 meters (%)
    public let relativeHumidity2MMin: Int?
    /// Daily mean atmospheric pressure at mean sea level (hPa)
    public let pressureMslMean: Double?
    /// Daily mean surface pressure at ground level (hPa)
    public let surfacePressureMean: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        timestamp: Date? = nil,
        weatherCode: Int? = nil,
        temperature2MMean: Double? = nil,
        temperature2MMax: Double? = nil,
        temperature2MMin: Double? = nil,
        apparentTemperatureMean: Double? = nil,
        apparentTemperatureMax: Double? = nil,
        apparentTemperatureMin: Double? = nil,
        precipitationSum: Double? = nil,
        rainSum: Double? = nil,
        snowfallSum: Double? = nil,
        windSpeed10MMax: Double? = nil,
        windGusts10MMax: Double? = nil,
        windSpeed10MMean: Double? = nil,
        windSpeed10MMin: Double? = nil,
        windGusts10MMin: Double? = nil,
        windGusts10MMean: Double? = nil,
        windDirection10MDominant: Int? = nil,
        shortwaveRadiationSum: Double? = nil,
        et0FaoEvapotranspirationSum: Double? = nil,
        cloudCoverMean: Double? = nil,
        dewPoint2MMean: Double? = nil,
        dewPoint2MMax: Double? = nil,
        dewPoint2MMin: Double? = nil,
        relativeHumidity2MMean: Double? = nil,
        relativeHumidity2MMax: Int? = nil,
        relativeHumidity2MMin: Int? = nil,
        pressureMslMean: Double? = nil,
        surfacePressureMean: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.timestamp = timestamp
        self.weatherCode = weatherCode
        self.temperature2MMean = temperature2MMean
        self.temperature2MMax = temperature2MMax
        self.temperature2MMin = temperature2MMin
        self.apparentTemperatureMean = apparentTemperatureMean
        self.apparentTemperatureMax = apparentTemperatureMax
        self.apparentTemperatureMin = apparentTemperatureMin
        self.precipitationSum = precipitationSum
        self.rainSum = rainSum
        self.snowfallSum = snowfallSum
        self.windSpeed10MMax = windSpeed10MMax
        self.windGusts10MMax = windGusts10MMax
        self.windSpeed10MMean = windSpeed10MMean
        self.windSpeed10MMin = windSpeed10MMin
        self.windGusts10MMin = windGusts10MMin
        self.windGusts10MMean = windGusts10MMean
        self.windDirection10MDominant = windDirection10MDominant
        self.shortwaveRadiationSum = shortwaveRadiationSum
        self.et0FaoEvapotranspirationSum = et0FaoEvapotranspirationSum
        self.cloudCoverMean = cloudCoverMean
        self.dewPoint2MMean = dewPoint2MMean
        self.dewPoint2MMax = dewPoint2MMax
        self.dewPoint2MMin = dewPoint2MMin
        self.relativeHumidity2MMean = relativeHumidity2MMean
        self.relativeHumidity2MMax = relativeHumidity2MMax
        self.relativeHumidity2MMin = relativeHumidity2MMin
        self.pressureMslMean = pressureMslMean
        self.surfacePressureMean = surfacePressureMean
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.timestamp = try container.decodeIfPresent(Date.self, forKey: .timestamp)
        self.weatherCode = try container.decodeIfPresent(Int.self, forKey: .weatherCode)
        self.temperature2MMean = try container.decodeIfPresent(Double.self, forKey: .temperature2MMean)
        self.temperature2MMax = try container.decodeIfPresent(Double.self, forKey: .temperature2MMax)
        self.temperature2MMin = try container.decodeIfPresent(Double.self, forKey: .temperature2MMin)
        self.apparentTemperatureMean = try container.decodeIfPresent(Double.self, forKey: .apparentTemperatureMean)
        self.apparentTemperatureMax = try container.decodeIfPresent(Double.self, forKey: .apparentTemperatureMax)
        self.apparentTemperatureMin = try container.decodeIfPresent(Double.self, forKey: .apparentTemperatureMin)
        self.precipitationSum = try container.decodeIfPresent(Double.self, forKey: .precipitationSum)
        self.rainSum = try container.decodeIfPresent(Double.self, forKey: .rainSum)
        self.snowfallSum = try container.decodeIfPresent(Double.self, forKey: .snowfallSum)
        self.windSpeed10MMax = try container.decodeIfPresent(Double.self, forKey: .windSpeed10MMax)
        self.windGusts10MMax = try container.decodeIfPresent(Double.self, forKey: .windGusts10MMax)
        self.windSpeed10MMean = try container.decodeIfPresent(Double.self, forKey: .windSpeed10MMean)
        self.windSpeed10MMin = try container.decodeIfPresent(Double.self, forKey: .windSpeed10MMin)
        self.windGusts10MMin = try container.decodeIfPresent(Double.self, forKey: .windGusts10MMin)
        self.windGusts10MMean = try container.decodeIfPresent(Double.self, forKey: .windGusts10MMean)
        self.windDirection10MDominant = try container.decodeIfPresent(Int.self, forKey: .windDirection10MDominant)
        self.shortwaveRadiationSum = try container.decodeIfPresent(Double.self, forKey: .shortwaveRadiationSum)
        self.et0FaoEvapotranspirationSum = try container.decodeIfPresent(Double.self, forKey: .et0FaoEvapotranspirationSum)
        self.cloudCoverMean = try container.decodeIfPresent(Double.self, forKey: .cloudCoverMean)
        self.dewPoint2MMean = try container.decodeIfPresent(Double.self, forKey: .dewPoint2MMean)
        self.dewPoint2MMax = try container.decodeIfPresent(Double.self, forKey: .dewPoint2MMax)
        self.dewPoint2MMin = try container.decodeIfPresent(Double.self, forKey: .dewPoint2MMin)
        self.relativeHumidity2MMean = try container.decodeIfPresent(Double.self, forKey: .relativeHumidity2MMean)
        self.relativeHumidity2MMax = try container.decodeIfPresent(Int.self, forKey: .relativeHumidity2MMax)
        self.relativeHumidity2MMin = try container.decodeIfPresent(Int.self, forKey: .relativeHumidity2MMin)
        self.pressureMslMean = try container.decodeIfPresent(Double.self, forKey: .pressureMslMean)
        self.surfacePressureMean = try container.decodeIfPresent(Double.self, forKey: .surfacePressureMean)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.weatherCode, forKey: .weatherCode)
        try container.encodeIfPresent(self.temperature2MMean, forKey: .temperature2MMean)
        try container.encodeIfPresent(self.temperature2MMax, forKey: .temperature2MMax)
        try container.encodeIfPresent(self.temperature2MMin, forKey: .temperature2MMin)
        try container.encodeIfPresent(self.apparentTemperatureMean, forKey: .apparentTemperatureMean)
        try container.encodeIfPresent(self.apparentTemperatureMax, forKey: .apparentTemperatureMax)
        try container.encodeIfPresent(self.apparentTemperatureMin, forKey: .apparentTemperatureMin)
        try container.encodeIfPresent(self.precipitationSum, forKey: .precipitationSum)
        try container.encodeIfPresent(self.rainSum, forKey: .rainSum)
        try container.encodeIfPresent(self.snowfallSum, forKey: .snowfallSum)
        try container.encodeIfPresent(self.windSpeed10MMax, forKey: .windSpeed10MMax)
        try container.encodeIfPresent(self.windGusts10MMax, forKey: .windGusts10MMax)
        try container.encodeIfPresent(self.windSpeed10MMean, forKey: .windSpeed10MMean)
        try container.encodeIfPresent(self.windSpeed10MMin, forKey: .windSpeed10MMin)
        try container.encodeIfPresent(self.windGusts10MMin, forKey: .windGusts10MMin)
        try container.encodeIfPresent(self.windGusts10MMean, forKey: .windGusts10MMean)
        try container.encodeIfPresent(self.windDirection10MDominant, forKey: .windDirection10MDominant)
        try container.encodeIfPresent(self.shortwaveRadiationSum, forKey: .shortwaveRadiationSum)
        try container.encodeIfPresent(self.et0FaoEvapotranspirationSum, forKey: .et0FaoEvapotranspirationSum)
        try container.encodeIfPresent(self.cloudCoverMean, forKey: .cloudCoverMean)
        try container.encodeIfPresent(self.dewPoint2MMean, forKey: .dewPoint2MMean)
        try container.encodeIfPresent(self.dewPoint2MMax, forKey: .dewPoint2MMax)
        try container.encodeIfPresent(self.dewPoint2MMin, forKey: .dewPoint2MMin)
        try container.encodeIfPresent(self.relativeHumidity2MMean, forKey: .relativeHumidity2MMean)
        try container.encodeIfPresent(self.relativeHumidity2MMax, forKey: .relativeHumidity2MMax)
        try container.encodeIfPresent(self.relativeHumidity2MMin, forKey: .relativeHumidity2MMin)
        try container.encodeIfPresent(self.pressureMslMean, forKey: .pressureMslMean)
        try container.encodeIfPresent(self.surfacePressureMean, forKey: .surfacePressureMean)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case timestamp
        case weatherCode = "weather_code"
        case temperature2MMean = "temperature_2m_mean"
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
        case apparentTemperatureMean = "apparent_temperature_mean"
        case apparentTemperatureMax = "apparent_temperature_max"
        case apparentTemperatureMin = "apparent_temperature_min"
        case precipitationSum = "precipitation_sum"
        case rainSum = "rain_sum"
        case snowfallSum = "snowfall_sum"
        case windSpeed10MMax = "wind_speed_10m_max"
        case windGusts10MMax = "wind_gusts_10m_max"
        case windSpeed10MMean = "wind_speed_10m_mean"
        case windSpeed10MMin = "wind_speed_10m_min"
        case windGusts10MMin = "wind_gusts_10m_min"
        case windGusts10MMean = "wind_gusts_10m_mean"
        case windDirection10MDominant = "wind_direction_10m_dominant"
        case shortwaveRadiationSum = "shortwave_radiation_sum"
        case et0FaoEvapotranspirationSum = "et0_fao_evapotranspiration_sum"
        case cloudCoverMean = "cloud_cover_mean"
        case dewPoint2MMean = "dew_point_2m_mean"
        case dewPoint2MMax = "dew_point_2m_max"
        case dewPoint2MMin = "dew_point_2m_min"
        case relativeHumidity2MMean = "relative_humidity_2m_mean"
        case relativeHumidity2MMax = "relative_humidity_2m_max"
        case relativeHumidity2MMin = "relative_humidity_2m_min"
        case pressureMslMean = "pressure_msl_mean"
        case surfacePressureMean = "surface_pressure_mean"
    }
}