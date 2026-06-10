import Foundation

public struct AstronomyLookupResponseAstronomy: Codable, Hashable, Sendable {
    /// Time zone to receive all time-based data in your preferred local time.
    public let timeZone: String?
    /// Date for astronomy data (YYYY-MM-DD)
    public let date: String
    /// Current time (HH:mm:ss.SSS)
    public let currentTime: String
    /// Midnight time (HH:mm)
    public let midNight: String
    /// Time when night ends (HH:mm)
    public let nightEnd: String
    public let morning: AstronomyLookupResponseAstronomyMorning
    /// Sunrise time (HH:mm)
    public let sunrise: String
    /// Sunset time (HH:mm)
    public let sunset: String
    public let evening: AstronomyLookupResponseAstronomyEvening
    /// Time when night begins (HH:mm)
    public let nightBegin: String
    /// Current status of the sun
    public let sunStatus: String
    /// Solar noon time (HH:mm)
    public let solarNoon: String
    /// Length of the day (HH:mm)
    public let dayLength: String
    /// Sun altitude angle
    public let sunAltitude: Float
    /// Distance from Earth to Sun
    public let sunDistance: Float
    /// Sun azimuth angle
    public let sunAzimuth: Float
    /// Moon phase
    public let moonPhase: String
    /// Moonrise time (HH:mm)
    public let moonrise: String
    /// Moonset time (HH:mm)
    public let moonset: String
    /// Current status of the moon
    public let moonStatus: String
    /// Moon altitude angle
    public let moonAltitude: Float
    /// Distance from Earth to Moon
    public let moonDistance: Float
    /// Moon azimuth angle
    public let moonAzimuth: Float
    /// Moon parallactic angle
    public let moonParallacticAngle: Float
    /// Moon illumination percentage
    public let moonIlluminationPercentage: String
    /// Moon angle
    public let moonAngle: Float
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        timeZone: String? = nil,
        date: String,
        currentTime: String,
        midNight: String,
        nightEnd: String,
        morning: AstronomyLookupResponseAstronomyMorning,
        sunrise: String,
        sunset: String,
        evening: AstronomyLookupResponseAstronomyEvening,
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
        self.morning = try container.decode(AstronomyLookupResponseAstronomyMorning.self, forKey: .morning)
        self.sunrise = try container.decode(String.self, forKey: .sunrise)
        self.sunset = try container.decode(String.self, forKey: .sunset)
        self.evening = try container.decode(AstronomyLookupResponseAstronomyEvening.self, forKey: .evening)
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