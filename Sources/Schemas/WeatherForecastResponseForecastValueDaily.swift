import Foundation

/// Daily forecast data
public struct WeatherForecastResponseForecastValueDaily: Codable, Hashable, Sendable {
    /// ISO 8601 formatted timestamp
    public let timestamp: Date?
    /// Weather condition code
    public let weatherCode: Int?
    /// Maximum air temperature at 2m (°C)
    public let temperature2MMax: Double?
    /// Minimum air temperature at 2m (°C)
    public let temperature2MMin: Double?
    /// Mean air temperature at 2m (°C)
    public let temperature2MMean: Double?
    /// Maximum feels-like temperature (°C)
    public let apparentTemperatureMax: Double?
    /// Minimum feels-like temperature (°C)
    public let apparentTemperatureMin: Double?
    /// Mean feels-like temperature (°C)
    public let apparentTemperatureMean: Double?
    /// Daily maximum UV index
    public let uvIndexMax: Double?
    /// UV index clear sky max
    public let uvIndexClearSkyMax: Double?
    /// Total rain (mm)
    public let rainSum: Double?
    /// Total showers (mm)
    public let showersSum: Double?
    /// Total snowfall (cm)
    public let snowfallSum: Double?
    /// Total precipitation (mm)
    public let precipitationSum: Double?
    /// Mean probability of precipitation (%)
    public let precipitationProbabilityMean: Int?
    /// Max wind speed at 10m (km/h)
    public let windSpeed10MMax: Double?
    /// Min wind speed at 10m (km/h)
    public let windSpeed10MMin: Double?
    /// Mean wind speed at 10m (km/h)
    public let windSpeed10MMean: Double?
    /// Max wind gusts at 10m (km/h)
    public let windGusts10MMax: Double?
    /// Min wind gusts at 10m (km/h)
    public let windGusts10MMin: Double?
    /// Mean wind gusts at 10m (km/h)
    public let windGusts10MMean: Double?
    /// Dominant wind direction at 10m (°)
    public let windDirection10MDominant: Int?
    /// Total shortwave radiation (MJ/m²)
    public let shortwaveRadiationSum: Double?
    /// Mean surface pressure (hPa)
    public let surfacePressureMean: Double?
    /// Mean sea-level pressure (hPa)
    public let pressureMslMean: Double?
    /// Mean visibility distance (m)
    public let visibilityMean: Double?
    /// Mean cloud cover (%)
    public let cloudCoverMean: Int?
    /// Max dew point at 2m (°C)
    public let dewPoint2MMax: Double?
    /// Min dew point at 2m (°C)
    public let dewPoint2MMin: Double?
    /// Mean dew point at 2m (°C)
    public let dewPoint2MMean: Double?
    /// Max relative humidity (%)
    public let relativeHumidity2MMax: Int?
    /// Min relative humidity (%)
    public let relativeHumidity2MMin: Int?
    /// Mean relative humidity (%)
    public let relativeHumidity2MMean: Int?
    /// ET₀ Reference Evapotranspiration (mm)
    public let et0FaoEvapotranspirationSum: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        timestamp: Date? = nil,
        weatherCode: Int? = nil,
        temperature2MMax: Double? = nil,
        temperature2MMin: Double? = nil,
        temperature2MMean: Double? = nil,
        apparentTemperatureMax: Double? = nil,
        apparentTemperatureMin: Double? = nil,
        apparentTemperatureMean: Double? = nil,
        uvIndexMax: Double? = nil,
        uvIndexClearSkyMax: Double? = nil,
        rainSum: Double? = nil,
        showersSum: Double? = nil,
        snowfallSum: Double? = nil,
        precipitationSum: Double? = nil,
        precipitationProbabilityMean: Int? = nil,
        windSpeed10MMax: Double? = nil,
        windSpeed10MMin: Double? = nil,
        windSpeed10MMean: Double? = nil,
        windGusts10MMax: Double? = nil,
        windGusts10MMin: Double? = nil,
        windGusts10MMean: Double? = nil,
        windDirection10MDominant: Int? = nil,
        shortwaveRadiationSum: Double? = nil,
        surfacePressureMean: Double? = nil,
        pressureMslMean: Double? = nil,
        visibilityMean: Double? = nil,
        cloudCoverMean: Int? = nil,
        dewPoint2MMax: Double? = nil,
        dewPoint2MMin: Double? = nil,
        dewPoint2MMean: Double? = nil,
        relativeHumidity2MMax: Int? = nil,
        relativeHumidity2MMin: Int? = nil,
        relativeHumidity2MMean: Int? = nil,
        et0FaoEvapotranspirationSum: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.timestamp = timestamp
        self.weatherCode = weatherCode
        self.temperature2MMax = temperature2MMax
        self.temperature2MMin = temperature2MMin
        self.temperature2MMean = temperature2MMean
        self.apparentTemperatureMax = apparentTemperatureMax
        self.apparentTemperatureMin = apparentTemperatureMin
        self.apparentTemperatureMean = apparentTemperatureMean
        self.uvIndexMax = uvIndexMax
        self.uvIndexClearSkyMax = uvIndexClearSkyMax
        self.rainSum = rainSum
        self.showersSum = showersSum
        self.snowfallSum = snowfallSum
        self.precipitationSum = precipitationSum
        self.precipitationProbabilityMean = precipitationProbabilityMean
        self.windSpeed10MMax = windSpeed10MMax
        self.windSpeed10MMin = windSpeed10MMin
        self.windSpeed10MMean = windSpeed10MMean
        self.windGusts10MMax = windGusts10MMax
        self.windGusts10MMin = windGusts10MMin
        self.windGusts10MMean = windGusts10MMean
        self.windDirection10MDominant = windDirection10MDominant
        self.shortwaveRadiationSum = shortwaveRadiationSum
        self.surfacePressureMean = surfacePressureMean
        self.pressureMslMean = pressureMslMean
        self.visibilityMean = visibilityMean
        self.cloudCoverMean = cloudCoverMean
        self.dewPoint2MMax = dewPoint2MMax
        self.dewPoint2MMin = dewPoint2MMin
        self.dewPoint2MMean = dewPoint2MMean
        self.relativeHumidity2MMax = relativeHumidity2MMax
        self.relativeHumidity2MMin = relativeHumidity2MMin
        self.relativeHumidity2MMean = relativeHumidity2MMean
        self.et0FaoEvapotranspirationSum = et0FaoEvapotranspirationSum
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.timestamp = try container.decodeIfPresent(Date.self, forKey: .timestamp)
        self.weatherCode = try container.decodeIfPresent(Int.self, forKey: .weatherCode)
        self.temperature2MMax = try container.decodeIfPresent(Double.self, forKey: .temperature2MMax)
        self.temperature2MMin = try container.decodeIfPresent(Double.self, forKey: .temperature2MMin)
        self.temperature2MMean = try container.decodeIfPresent(Double.self, forKey: .temperature2MMean)
        self.apparentTemperatureMax = try container.decodeIfPresent(Double.self, forKey: .apparentTemperatureMax)
        self.apparentTemperatureMin = try container.decodeIfPresent(Double.self, forKey: .apparentTemperatureMin)
        self.apparentTemperatureMean = try container.decodeIfPresent(Double.self, forKey: .apparentTemperatureMean)
        self.uvIndexMax = try container.decodeIfPresent(Double.self, forKey: .uvIndexMax)
        self.uvIndexClearSkyMax = try container.decodeIfPresent(Double.self, forKey: .uvIndexClearSkyMax)
        self.rainSum = try container.decodeIfPresent(Double.self, forKey: .rainSum)
        self.showersSum = try container.decodeIfPresent(Double.self, forKey: .showersSum)
        self.snowfallSum = try container.decodeIfPresent(Double.self, forKey: .snowfallSum)
        self.precipitationSum = try container.decodeIfPresent(Double.self, forKey: .precipitationSum)
        self.precipitationProbabilityMean = try container.decodeIfPresent(Int.self, forKey: .precipitationProbabilityMean)
        self.windSpeed10MMax = try container.decodeIfPresent(Double.self, forKey: .windSpeed10MMax)
        self.windSpeed10MMin = try container.decodeIfPresent(Double.self, forKey: .windSpeed10MMin)
        self.windSpeed10MMean = try container.decodeIfPresent(Double.self, forKey: .windSpeed10MMean)
        self.windGusts10MMax = try container.decodeIfPresent(Double.self, forKey: .windGusts10MMax)
        self.windGusts10MMin = try container.decodeIfPresent(Double.self, forKey: .windGusts10MMin)
        self.windGusts10MMean = try container.decodeIfPresent(Double.self, forKey: .windGusts10MMean)
        self.windDirection10MDominant = try container.decodeIfPresent(Int.self, forKey: .windDirection10MDominant)
        self.shortwaveRadiationSum = try container.decodeIfPresent(Double.self, forKey: .shortwaveRadiationSum)
        self.surfacePressureMean = try container.decodeIfPresent(Double.self, forKey: .surfacePressureMean)
        self.pressureMslMean = try container.decodeIfPresent(Double.self, forKey: .pressureMslMean)
        self.visibilityMean = try container.decodeIfPresent(Double.self, forKey: .visibilityMean)
        self.cloudCoverMean = try container.decodeIfPresent(Int.self, forKey: .cloudCoverMean)
        self.dewPoint2MMax = try container.decodeIfPresent(Double.self, forKey: .dewPoint2MMax)
        self.dewPoint2MMin = try container.decodeIfPresent(Double.self, forKey: .dewPoint2MMin)
        self.dewPoint2MMean = try container.decodeIfPresent(Double.self, forKey: .dewPoint2MMean)
        self.relativeHumidity2MMax = try container.decodeIfPresent(Int.self, forKey: .relativeHumidity2MMax)
        self.relativeHumidity2MMin = try container.decodeIfPresent(Int.self, forKey: .relativeHumidity2MMin)
        self.relativeHumidity2MMean = try container.decodeIfPresent(Int.self, forKey: .relativeHumidity2MMean)
        self.et0FaoEvapotranspirationSum = try container.decodeIfPresent(Double.self, forKey: .et0FaoEvapotranspirationSum)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.weatherCode, forKey: .weatherCode)
        try container.encodeIfPresent(self.temperature2MMax, forKey: .temperature2MMax)
        try container.encodeIfPresent(self.temperature2MMin, forKey: .temperature2MMin)
        try container.encodeIfPresent(self.temperature2MMean, forKey: .temperature2MMean)
        try container.encodeIfPresent(self.apparentTemperatureMax, forKey: .apparentTemperatureMax)
        try container.encodeIfPresent(self.apparentTemperatureMin, forKey: .apparentTemperatureMin)
        try container.encodeIfPresent(self.apparentTemperatureMean, forKey: .apparentTemperatureMean)
        try container.encodeIfPresent(self.uvIndexMax, forKey: .uvIndexMax)
        try container.encodeIfPresent(self.uvIndexClearSkyMax, forKey: .uvIndexClearSkyMax)
        try container.encodeIfPresent(self.rainSum, forKey: .rainSum)
        try container.encodeIfPresent(self.showersSum, forKey: .showersSum)
        try container.encodeIfPresent(self.snowfallSum, forKey: .snowfallSum)
        try container.encodeIfPresent(self.precipitationSum, forKey: .precipitationSum)
        try container.encodeIfPresent(self.precipitationProbabilityMean, forKey: .precipitationProbabilityMean)
        try container.encodeIfPresent(self.windSpeed10MMax, forKey: .windSpeed10MMax)
        try container.encodeIfPresent(self.windSpeed10MMin, forKey: .windSpeed10MMin)
        try container.encodeIfPresent(self.windSpeed10MMean, forKey: .windSpeed10MMean)
        try container.encodeIfPresent(self.windGusts10MMax, forKey: .windGusts10MMax)
        try container.encodeIfPresent(self.windGusts10MMin, forKey: .windGusts10MMin)
        try container.encodeIfPresent(self.windGusts10MMean, forKey: .windGusts10MMean)
        try container.encodeIfPresent(self.windDirection10MDominant, forKey: .windDirection10MDominant)
        try container.encodeIfPresent(self.shortwaveRadiationSum, forKey: .shortwaveRadiationSum)
        try container.encodeIfPresent(self.surfacePressureMean, forKey: .surfacePressureMean)
        try container.encodeIfPresent(self.pressureMslMean, forKey: .pressureMslMean)
        try container.encodeIfPresent(self.visibilityMean, forKey: .visibilityMean)
        try container.encodeIfPresent(self.cloudCoverMean, forKey: .cloudCoverMean)
        try container.encodeIfPresent(self.dewPoint2MMax, forKey: .dewPoint2MMax)
        try container.encodeIfPresent(self.dewPoint2MMin, forKey: .dewPoint2MMin)
        try container.encodeIfPresent(self.dewPoint2MMean, forKey: .dewPoint2MMean)
        try container.encodeIfPresent(self.relativeHumidity2MMax, forKey: .relativeHumidity2MMax)
        try container.encodeIfPresent(self.relativeHumidity2MMin, forKey: .relativeHumidity2MMin)
        try container.encodeIfPresent(self.relativeHumidity2MMean, forKey: .relativeHumidity2MMean)
        try container.encodeIfPresent(self.et0FaoEvapotranspirationSum, forKey: .et0FaoEvapotranspirationSum)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case timestamp
        case weatherCode = "weather_code"
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
        case temperature2MMean = "temperature_2m_mean"
        case apparentTemperatureMax = "apparent_temperature_max"
        case apparentTemperatureMin = "apparent_temperature_min"
        case apparentTemperatureMean = "apparent_temperature_mean"
        case uvIndexMax = "uv_index_max"
        case uvIndexClearSkyMax = "uv_index_clear_sky_max"
        case rainSum = "rain_sum"
        case showersSum = "showers_sum"
        case snowfallSum = "snowfall_sum"
        case precipitationSum = "precipitation_sum"
        case precipitationProbabilityMean = "precipitation_probability_mean"
        case windSpeed10MMax = "wind_speed_10m_max"
        case windSpeed10MMin = "wind_speed_10m_min"
        case windSpeed10MMean = "wind_speed_10m_mean"
        case windGusts10MMax = "wind_gusts_10m_max"
        case windGusts10MMin = "wind_gusts_10m_min"
        case windGusts10MMean = "wind_gusts_10m_mean"
        case windDirection10MDominant = "wind_direction_10m_dominant"
        case shortwaveRadiationSum = "shortwave_radiation_sum"
        case surfacePressureMean = "surface_pressure_mean"
        case pressureMslMean = "pressure_msl_mean"
        case visibilityMean = "visibility_mean"
        case cloudCoverMean = "cloud_cover_mean"
        case dewPoint2MMax = "dew_point_2m_max"
        case dewPoint2MMin = "dew_point_2m_min"
        case dewPoint2MMean = "dew_point_2m_mean"
        case relativeHumidity2MMax = "relative_humidity_2m_max"
        case relativeHumidity2MMin = "relative_humidity_2m_min"
        case relativeHumidity2MMean = "relative_humidity_2m_mean"
        case et0FaoEvapotranspirationSum = "et0_fao_evapotranspiration_sum"
    }
}