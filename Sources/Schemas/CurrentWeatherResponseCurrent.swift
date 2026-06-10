import Foundation

/// Current weather data
public struct CurrentWeatherResponseCurrent: Codable, Hashable, Sendable {
    /// ISO 8601 formatted timestamp of the current weather observation.
    public let timestamp: Date
    /// Current air temperature (°C) measured at 2 meters above ground.
    public let temperature2M: Float
    /// Current relative humidity percentage at 2 meters above ground.
    public let relativeHumidity2M: Float
    /// Current apparent temperature (°C) accounting for wind chill and humidity.
    public let apparentTemperature: Float
    /// Current snowfall accumulation in centimeters.
    public let snowfall: Float
    /// Current rainfall accumulation in millimeters.
    public let rain: Float
    /// Current shower precipitation in millimeters.
    public let showers: Float
    /// Total precipitation (mm) including rain, showers, and snowfall.
    public let precipitation: Float
    /// WMO weather condition code representing current conditions. Supported codes: 0 clear sky; 1, 2, 3 varying cloud cover; 45, 48 fog; 51, 53, 55 drizzle; 56, 57 freezing drizzle; 61, 63, 65 rain; 66, 67 freezing rain; 71, 73, 75 snowfall; 77 snow grains; 80, 81, 82 rain showers; 85, 86 snow showers; 95 thunderstorm; 96, 99 thunderstorm with hail.
    public let weatherCode: Int
    /// Current percentage of sky covered by clouds.
    public let cloudCover: Float
    /// Current atmospheric pressure (hPa) adjusted to mean sea level.
    public let pressureMsl: Float
    /// Current atmospheric pressure (hPa) at surface level.
    public let surfacePressure: Float
    /// Current wind speed (km/h) at 10 meters above ground.
    public let windSpeed10M: Float
    /// Current wind direction in degrees at 10 meters above ground.
    public let windDirection10M: Int
    /// Current wind gust speed (km/h) at 10 meters above ground.
    public let windGusts10M: Float
    /// Astronomical information including sunrise, sunset, and moon phases for the current date.
    public let astronomy: CurrentWeatherResponseCurrentAstronomy
    /// Air quality metrics including pollutant concentrations and AQI values.
    public let airQuality: CurrentWeatherResponseCurrentAirQuality
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        timestamp: Date,
        temperature2M: Float,
        relativeHumidity2M: Float,
        apparentTemperature: Float,
        snowfall: Float,
        rain: Float,
        showers: Float,
        precipitation: Float,
        weatherCode: Int,
        cloudCover: Float,
        pressureMsl: Float,
        surfacePressure: Float,
        windSpeed10M: Float,
        windDirection10M: Int,
        windGusts10M: Float,
        astronomy: CurrentWeatherResponseCurrentAstronomy,
        airQuality: CurrentWeatherResponseCurrentAirQuality,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.timestamp = timestamp
        self.temperature2M = temperature2M
        self.relativeHumidity2M = relativeHumidity2M
        self.apparentTemperature = apparentTemperature
        self.snowfall = snowfall
        self.rain = rain
        self.showers = showers
        self.precipitation = precipitation
        self.weatherCode = weatherCode
        self.cloudCover = cloudCover
        self.pressureMsl = pressureMsl
        self.surfacePressure = surfacePressure
        self.windSpeed10M = windSpeed10M
        self.windDirection10M = windDirection10M
        self.windGusts10M = windGusts10M
        self.astronomy = astronomy
        self.airQuality = airQuality
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.timestamp = try container.decode(Date.self, forKey: .timestamp)
        self.temperature2M = try container.decode(Float.self, forKey: .temperature2M)
        self.relativeHumidity2M = try container.decode(Float.self, forKey: .relativeHumidity2M)
        self.apparentTemperature = try container.decode(Float.self, forKey: .apparentTemperature)
        self.snowfall = try container.decode(Float.self, forKey: .snowfall)
        self.rain = try container.decode(Float.self, forKey: .rain)
        self.showers = try container.decode(Float.self, forKey: .showers)
        self.precipitation = try container.decode(Float.self, forKey: .precipitation)
        self.weatherCode = try container.decode(Int.self, forKey: .weatherCode)
        self.cloudCover = try container.decode(Float.self, forKey: .cloudCover)
        self.pressureMsl = try container.decode(Float.self, forKey: .pressureMsl)
        self.surfacePressure = try container.decode(Float.self, forKey: .surfacePressure)
        self.windSpeed10M = try container.decode(Float.self, forKey: .windSpeed10M)
        self.windDirection10M = try container.decode(Int.self, forKey: .windDirection10M)
        self.windGusts10M = try container.decode(Float.self, forKey: .windGusts10M)
        self.astronomy = try container.decode(CurrentWeatherResponseCurrentAstronomy.self, forKey: .astronomy)
        self.airQuality = try container.decode(CurrentWeatherResponseCurrentAirQuality.self, forKey: .airQuality)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.timestamp, forKey: .timestamp)
        try container.encode(self.temperature2M, forKey: .temperature2M)
        try container.encode(self.relativeHumidity2M, forKey: .relativeHumidity2M)
        try container.encode(self.apparentTemperature, forKey: .apparentTemperature)
        try container.encode(self.snowfall, forKey: .snowfall)
        try container.encode(self.rain, forKey: .rain)
        try container.encode(self.showers, forKey: .showers)
        try container.encode(self.precipitation, forKey: .precipitation)
        try container.encode(self.weatherCode, forKey: .weatherCode)
        try container.encode(self.cloudCover, forKey: .cloudCover)
        try container.encode(self.pressureMsl, forKey: .pressureMsl)
        try container.encode(self.surfacePressure, forKey: .surfacePressure)
        try container.encode(self.windSpeed10M, forKey: .windSpeed10M)
        try container.encode(self.windDirection10M, forKey: .windDirection10M)
        try container.encode(self.windGusts10M, forKey: .windGusts10M)
        try container.encode(self.astronomy, forKey: .astronomy)
        try container.encode(self.airQuality, forKey: .airQuality)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case timestamp
        case temperature2M = "temperature_2m"
        case relativeHumidity2M = "relative_humidity_2m"
        case apparentTemperature = "apparent_temperature"
        case snowfall
        case rain
        case showers
        case precipitation
        case weatherCode = "weather_code"
        case cloudCover = "cloud_cover"
        case pressureMsl = "pressure_msl"
        case surfacePressure = "surface_pressure"
        case windSpeed10M = "wind_speed_10m"
        case windDirection10M = "wind_direction_10m"
        case windGusts10M = "wind_gusts_10m"
        case astronomy
        case airQuality = "air_quality"
    }
}