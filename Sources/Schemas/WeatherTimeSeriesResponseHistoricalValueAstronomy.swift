import Foundation

/// Astronomy data
public struct WeatherTimeSeriesResponseHistoricalValueAstronomy: Codable, Hashable, Sendable {
    /// Calendar date in YYYY-MM-DD format for the astronomical data.
    public let date: CalendarDate
    /// Time of true solar midnight in HH:MM format.
    public let midNight: String
    /// Time when astronomical twilight ends and dawn begins in HH:MM format.
    public let nightEnd: String
    /// Time when the Sun becomes visible above the horizon in HH:MM format.
    public let sunrise: String
    /// Time when the Sun reaches its highest point in the sky in HH:MM format.
    public let solarNoon: String
    /// Time when the Sun disappears below the horizon in HH:MM format.
    public let sunset: String
    /// Time when astronomical twilight begins and night starts in HH:MM format.
    public let nightBegin: String
    /// Total duration of daylight in HH:MM format.
    public let dayLength: String
    /// Current position of the Sun relative to the horizon (above_horizon, below_horizon, or -).
    public let sunStatus: String
    /// Current lunar phase (NEW_MOON, WAXING_CRESCENT, FULL_MOON, WANING_GIBBOUS, etc.).
    public let moonPhase: String
    /// Time when the Moon becomes visible above the horizon in HH:MM format.
    public let moonrise: String
    /// Time when the Moon disappears below the horizon in HH:MM format.
    public let moonset: String
    /// Current visibility status of the Moon (visible, not_visible, or -).
    public let moonStatus: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        date: CalendarDate,
        midNight: String,
        nightEnd: String,
        sunrise: String,
        solarNoon: String,
        sunset: String,
        nightBegin: String,
        dayLength: String,
        sunStatus: String,
        moonPhase: String,
        moonrise: String,
        moonset: String,
        moonStatus: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.date = date
        self.midNight = midNight
        self.nightEnd = nightEnd
        self.sunrise = sunrise
        self.solarNoon = solarNoon
        self.sunset = sunset
        self.nightBegin = nightBegin
        self.dayLength = dayLength
        self.sunStatus = sunStatus
        self.moonPhase = moonPhase
        self.moonrise = moonrise
        self.moonset = moonset
        self.moonStatus = moonStatus
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decode(CalendarDate.self, forKey: .date)
        self.midNight = try container.decode(String.self, forKey: .midNight)
        self.nightEnd = try container.decode(String.self, forKey: .nightEnd)
        self.sunrise = try container.decode(String.self, forKey: .sunrise)
        self.solarNoon = try container.decode(String.self, forKey: .solarNoon)
        self.sunset = try container.decode(String.self, forKey: .sunset)
        self.nightBegin = try container.decode(String.self, forKey: .nightBegin)
        self.dayLength = try container.decode(String.self, forKey: .dayLength)
        self.sunStatus = try container.decode(String.self, forKey: .sunStatus)
        self.moonPhase = try container.decode(String.self, forKey: .moonPhase)
        self.moonrise = try container.decode(String.self, forKey: .moonrise)
        self.moonset = try container.decode(String.self, forKey: .moonset)
        self.moonStatus = try container.decode(String.self, forKey: .moonStatus)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.date, forKey: .date)
        try container.encode(self.midNight, forKey: .midNight)
        try container.encode(self.nightEnd, forKey: .nightEnd)
        try container.encode(self.sunrise, forKey: .sunrise)
        try container.encode(self.solarNoon, forKey: .solarNoon)
        try container.encode(self.sunset, forKey: .sunset)
        try container.encode(self.nightBegin, forKey: .nightBegin)
        try container.encode(self.dayLength, forKey: .dayLength)
        try container.encode(self.sunStatus, forKey: .sunStatus)
        try container.encode(self.moonPhase, forKey: .moonPhase)
        try container.encode(self.moonrise, forKey: .moonrise)
        try container.encode(self.moonset, forKey: .moonset)
        try container.encode(self.moonStatus, forKey: .moonStatus)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case date
        case midNight = "mid_night"
        case nightEnd = "night_end"
        case sunrise
        case solarNoon = "solar_noon"
        case sunset
        case nightBegin = "night_begin"
        case dayLength = "day_length"
        case sunStatus = "sun_status"
        case moonPhase = "moon_phase"
        case moonrise
        case moonset
        case moonStatus = "moon_status"
    }
}