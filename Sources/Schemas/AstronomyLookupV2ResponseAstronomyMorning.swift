import Foundation

/// Morning astronomical data including twilight, blue hour, and golden hour times.
public struct AstronomyLookupV2ResponseAstronomyMorning: Codable, Hashable, Sendable {
    /// The start time of astronomical twilight in the morning
    public let astronomicalTwilightBegin: String
    /// The end time of astronomical twilight in the morning
    public let astronomicalTwilightEnd: String
    /// The start time of nautical twilight in the morning
    public let nauticalTwilightBegin: String
    /// The end time of nautical twilight in the morning
    public let nauticalTwilightEnd: String
    /// The start time of civil twilight in the morning
    public let civilTwilightBegin: String
    /// The end time of civil twilight in the morning
    public let civilTwilightEnd: String
    /// The beginning of the blue hour in the morning
    public let blueHourBegin: String
    /// The end of the blue hour in the morning
    public let blueHourEnd: String
    /// The beginning of the golden hour in the morning
    public let goldenHourBegin: String
    /// The end of the golden hour in the morning
    public let goldenHourEnd: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        astronomicalTwilightBegin: String,
        astronomicalTwilightEnd: String,
        nauticalTwilightBegin: String,
        nauticalTwilightEnd: String,
        civilTwilightBegin: String,
        civilTwilightEnd: String,
        blueHourBegin: String,
        blueHourEnd: String,
        goldenHourBegin: String,
        goldenHourEnd: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.astronomicalTwilightBegin = astronomicalTwilightBegin
        self.astronomicalTwilightEnd = astronomicalTwilightEnd
        self.nauticalTwilightBegin = nauticalTwilightBegin
        self.nauticalTwilightEnd = nauticalTwilightEnd
        self.civilTwilightBegin = civilTwilightBegin
        self.civilTwilightEnd = civilTwilightEnd
        self.blueHourBegin = blueHourBegin
        self.blueHourEnd = blueHourEnd
        self.goldenHourBegin = goldenHourBegin
        self.goldenHourEnd = goldenHourEnd
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.astronomicalTwilightBegin = try container.decode(String.self, forKey: .astronomicalTwilightBegin)
        self.astronomicalTwilightEnd = try container.decode(String.self, forKey: .astronomicalTwilightEnd)
        self.nauticalTwilightBegin = try container.decode(String.self, forKey: .nauticalTwilightBegin)
        self.nauticalTwilightEnd = try container.decode(String.self, forKey: .nauticalTwilightEnd)
        self.civilTwilightBegin = try container.decode(String.self, forKey: .civilTwilightBegin)
        self.civilTwilightEnd = try container.decode(String.self, forKey: .civilTwilightEnd)
        self.blueHourBegin = try container.decode(String.self, forKey: .blueHourBegin)
        self.blueHourEnd = try container.decode(String.self, forKey: .blueHourEnd)
        self.goldenHourBegin = try container.decode(String.self, forKey: .goldenHourBegin)
        self.goldenHourEnd = try container.decode(String.self, forKey: .goldenHourEnd)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.astronomicalTwilightBegin, forKey: .astronomicalTwilightBegin)
        try container.encode(self.astronomicalTwilightEnd, forKey: .astronomicalTwilightEnd)
        try container.encode(self.nauticalTwilightBegin, forKey: .nauticalTwilightBegin)
        try container.encode(self.nauticalTwilightEnd, forKey: .nauticalTwilightEnd)
        try container.encode(self.civilTwilightBegin, forKey: .civilTwilightBegin)
        try container.encode(self.civilTwilightEnd, forKey: .civilTwilightEnd)
        try container.encode(self.blueHourBegin, forKey: .blueHourBegin)
        try container.encode(self.blueHourEnd, forKey: .blueHourEnd)
        try container.encode(self.goldenHourBegin, forKey: .goldenHourBegin)
        try container.encode(self.goldenHourEnd, forKey: .goldenHourEnd)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case astronomicalTwilightBegin = "astronomical_twilight_begin"
        case astronomicalTwilightEnd = "astronomical_twilight_end"
        case nauticalTwilightBegin = "nautical_twilight_begin"
        case nauticalTwilightEnd = "nautical_twilight_end"
        case civilTwilightBegin = "civil_twilight_begin"
        case civilTwilightEnd = "civil_twilight_end"
        case blueHourBegin = "blue_hour_begin"
        case blueHourEnd = "blue_hour_end"
        case goldenHourBegin = "golden_hour_begin"
        case goldenHourEnd = "golden_hour_end"
    }
}