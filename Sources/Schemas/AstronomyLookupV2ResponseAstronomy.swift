import Foundation

/// Complete astronomical data for the specified location and date.
public struct AstronomyLookupV2ResponseAstronomy: Codable, Hashable, Sendable {
    /// Appears (with the provided value) only when the user includes a time_zone in the query to specify which time to observe.
    public let timeZone: String?
    /// The date astronomy data was calculated for. Defaults to today's date; reflects the date query parameter's value when that parameter is supplied.
    public let date: String
    /// The current time
    public let currentTime: String
    /// The time of midnight (solar-based)
    public let midNight: String
    /// The time when night ends (start of astronomical twilight)
    public let nightEnd: String
    /// Morning astronomical data including twilight, blue hour, and golden hour times.
    public let morning: AstronomyLookupV2ResponseAstronomyMorning
    /// The time of sunrise
    public let sunrise: String
    /// The time of sunset
    public let sunset: String
    /// Evening astronomical data including golden hour, blue hour, and twilight times.
    public let evening: AstronomyLookupV2ResponseAstronomyEvening
    /// The time when night begins (end of astronomical twilight)
    public let nightBegin: String
    /// The current status of the sun (e.g., "rising", "setting", "-")
    public let sunStatus: String
    /// The time when the sun reaches its highest point in the sky
    public let solarNoon: String
    /// The total duration of daylight
    public let dayLength: String
    /// The altitude angle of the sun above the horizon in degrees
    public let sunAltitude: Float
    /// The distance from the Earth to the sun in kilometers
    public let sunDistance: Float
    /// The azimuth angle of the sun in degrees from true north
    public let sunAzimuth: Float
    /// The current phase of the moon (e.g., "WAXING_GIBBOUS")
    public let moonPhase: String
    /// The time of moonrise
    public let moonrise: String
    /// The time of moonset
    public let moonset: String
    /// The current status of the moon (e.g., "rising", "setting", "-")
    public let moonStatus: String
    /// The altitude angle of the moon above the horizon in degrees
    public let moonAltitude: Float
    /// The distance from the Earth to the moon in kilometers
    public let moonDistance: Float
    /// The azimuth angle of the moon in degrees from true north
    public let moonAzimuth: Float
    /// The parallactic angle of the moon in degrees
    public let moonParallacticAngle: Float
    /// The percentage of the moon illuminated by sunlight. A negative value indicates the moon is in a waning phase.
    public let moonIlluminationPercentage: String
    /// The geometric angle of the moon relative to the observer
    public let moonAngle: Float
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        timeZone: String? = nil,
        date: String,
        currentTime: String,
        midNight: String,
        nightEnd: String,
        morning: AstronomyLookupV2ResponseAstronomyMorning,
        sunrise: String,
        sunset: String,
        evening: AstronomyLookupV2ResponseAstronomyEvening,
        nightBegin: String,
        sunStatus: String,
        solarNoon: String,
        dayLength: String,
        sunAltitude: Float,
        sunDistance: Float,
        sunAzimuth: Float,
        moonPhase: String,
        moonrise: String,
        moonset: String,
        moonStatus: String,
        moonAltitude: Float,
        moonDistance: Float,
        moonAzimuth: Float,
        moonParallacticAngle: Float,
        moonIlluminationPercentage: String,
        moonAngle: Float,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.timeZone = timeZone
        self.date = date
        self.currentTime = currentTime
        self.midNight = midNight
        self.nightEnd = nightEnd
        self.morning = morning
        self.sunrise = sunrise
        self.sunset = sunset
        self.evening = evening
        self.nightBegin = nightBegin
        self.sunStatus = sunStatus
        self.solarNoon = solarNoon
        self.dayLength = dayLength
        self.sunAltitude = sunAltitude
        self.sunDistance = sunDistance
        self.sunAzimuth = sunAzimuth
        self.moonPhase = moonPhase
        self.moonrise = moonrise
        self.moonset = moonset
        self.moonStatus = moonStatus
        self.moonAltitude = moonAltitude
        self.moonDistance = moonDistance
        self.moonAzimuth = moonAzimuth
        self.moonParallacticAngle = moonParallacticAngle
        self.moonIlluminationPercentage = moonIlluminationPercentage
        self.moonAngle = moonAngle
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.timeZone = try container.decodeIfPresent(String.self, forKey: .timeZone)
        self.date = try container.decode(String.self, forKey: .date)
        self.currentTime = try container.decode(String.self, forKey: .currentTime)
        self.midNight = try container.decode(String.self, forKey: .midNight)
        self.nightEnd = try container.decode(String.self, forKey: .nightEnd)
        self.morning = try container.decode(AstronomyLookupV2ResponseAstronomyMorning.self, forKey: .morning)
        self.sunrise = try container.decode(String.self, forKey: .sunrise)
        self.sunset = try container.decode(String.self, forKey: .sunset)
        self.evening = try container.decode(AstronomyLookupV2ResponseAstronomyEvening.self, forKey: .evening)
        self.nightBegin = try container.decode(String.self, forKey: .nightBegin)
        self.sunStatus = try container.decode(String.self, forKey: .sunStatus)
        self.solarNoon = try container.decode(String.self, forKey: .solarNoon)
        self.dayLength = try container.decode(String.self, forKey: .dayLength)
        self.sunAltitude = try container.decode(Float.self, forKey: .sunAltitude)
        self.sunDistance = try container.decode(Float.self, forKey: .sunDistance)
        self.sunAzimuth = try container.decode(Float.self, forKey: .sunAzimuth)
        self.moonPhase = try container.decode(String.self, forKey: .moonPhase)
        self.moonrise = try container.decode(String.self, forKey: .moonrise)
        self.moonset = try container.decode(String.self, forKey: .moonset)
        self.moonStatus = try container.decode(String.self, forKey: .moonStatus)
        self.moonAltitude = try container.decode(Float.self, forKey: .moonAltitude)
        self.moonDistance = try container.decode(Float.self, forKey: .moonDistance)
        self.moonAzimuth = try container.decode(Float.self, forKey: .moonAzimuth)
        self.moonParallacticAngle = try container.decode(Float.self, forKey: .moonParallacticAngle)
        self.moonIlluminationPercentage = try container.decode(String.self, forKey: .moonIlluminationPercentage)
        self.moonAngle = try container.decode(Float.self, forKey: .moonAngle)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.timeZone, forKey: .timeZone)
        try container.encode(self.date, forKey: .date)
        try container.encode(self.currentTime, forKey: .currentTime)
        try container.encode(self.midNight, forKey: .midNight)
        try container.encode(self.nightEnd, forKey: .nightEnd)
        try container.encode(self.morning, forKey: .morning)
        try container.encode(self.sunrise, forKey: .sunrise)
        try container.encode(self.sunset, forKey: .sunset)
        try container.encode(self.evening, forKey: .evening)
        try container.encode(self.nightBegin, forKey: .nightBegin)
        try container.encode(self.sunStatus, forKey: .sunStatus)
        try container.encode(self.solarNoon, forKey: .solarNoon)
        try container.encode(self.dayLength, forKey: .dayLength)
        try container.encode(self.sunAltitude, forKey: .sunAltitude)
        try container.encode(self.sunDistance, forKey: .sunDistance)
        try container.encode(self.sunAzimuth, forKey: .sunAzimuth)
        try container.encode(self.moonPhase, forKey: .moonPhase)
        try container.encode(self.moonrise, forKey: .moonrise)
        try container.encode(self.moonset, forKey: .moonset)
        try container.encode(self.moonStatus, forKey: .moonStatus)
        try container.encode(self.moonAltitude, forKey: .moonAltitude)
        try container.encode(self.moonDistance, forKey: .moonDistance)
        try container.encode(self.moonAzimuth, forKey: .moonAzimuth)
        try container.encode(self.moonParallacticAngle, forKey: .moonParallacticAngle)
        try container.encode(self.moonIlluminationPercentage, forKey: .moonIlluminationPercentage)
        try container.encode(self.moonAngle, forKey: .moonAngle)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case timeZone = "time_zone"
        case date
        case currentTime = "current_time"
        case midNight = "mid_night"
        case nightEnd = "night_end"
        case morning
        case sunrise
        case sunset
        case evening
        case nightBegin = "night_begin"
        case sunStatus = "sun_status"
        case solarNoon = "solar_noon"
        case dayLength = "day_length"
        case sunAltitude = "sun_altitude"
        case sunDistance = "sun_distance"
        case sunAzimuth = "sun_azimuth"
        case moonPhase = "moon_phase"
        case moonrise
        case moonset
        case moonStatus = "moon_status"
        case moonAltitude = "moon_altitude"
        case moonDistance = "moon_distance"
        case moonAzimuth = "moon_azimuth"
        case moonParallacticAngle = "moon_parallactic_angle"
        case moonIlluminationPercentage = "moon_illumination_percentage"
        case moonAngle = "moon_angle"
    }
}