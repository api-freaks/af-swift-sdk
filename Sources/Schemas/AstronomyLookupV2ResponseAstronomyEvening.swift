import Foundation

/// Evening astronomical data including golden hour, blue hour, and twilight times.
public struct AstronomyLookupV2ResponseAstronomyEvening: Codable, Hashable, Sendable {
    /// The beginning of the golden hour in the evening
    public let goldenHourBegin: String
    /// The end of the golden hour in the evening
    public let goldenHourEnd: String
    /// The beginning of the blue hour in the evening
    public let blueHourBegin: String
    /// The end of the blue hour in the evening
    public let blueHourEnd: String
    /// The start of civil twilight in the evening
    public let civilTwilightBegin: String
    /// The end of civil twilight in the evening
    public let civilTwilightEnd: String
    /// The start of nautical twilight in the evening
    public let nauticalTwilightBegin: String
    /// The end of nautical twilight in the evening
    public let nauticalTwilightEnd: String
    /// The start of astronomical twilight in the evening
    public let astronomicalTwilightBegin: String
    /// The end of astronomical twilight in the evening
    public let astronomicalTwilightEnd: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        goldenHourBegin: String,
        goldenHourEnd: String,
        blueHourBegin: String,
        blueHourEnd: String,
        civilTwilightBegin: String,
        civilTwilightEnd: String,
        nauticalTwilightBegin: String,
        nauticalTwilightEnd: String,
        astronomicalTwilightBegin: String,
        astronomicalTwilightEnd: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.goldenHourBegin = goldenHourBegin
        self.goldenHourEnd = goldenHourEnd
        self.blueHourBegin = blueHourBegin
        self.blueHourEnd = blueHourEnd
        self.civilTwilightBegin = civilTwilightBegin
        self.civilTwilightEnd = civilTwilightEnd
        self.nauticalTwilightBegin = nauticalTwilightBegin
        self.nauticalTwilightEnd = nauticalTwilightEnd
        self.astronomicalTwilightBegin = astronomicalTwilightBegin
        self.astronomicalTwilightEnd = astronomicalTwilightEnd
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.goldenHourBegin = try container.decode(String.self, forKey: .goldenHourBegin)
        self.goldenHourEnd = try container.decode(String.self, forKey: .goldenHourEnd)
        self.blueHourBegin = try container.decode(String.self, forKey: .blueHourBegin)
        self.blueHourEnd = try container.decode(String.self, forKey: .blueHourEnd)
        self.civilTwilightBegin = try container.decode(String.self, forKey: .civilTwilightBegin)
        self.civilTwilightEnd = try container.decode(String.self, forKey: .civilTwilightEnd)
        self.nauticalTwilightBegin = try container.decode(String.self, forKey: .nauticalTwilightBegin)
        self.nauticalTwilightEnd = try container.decode(String.self, forKey: .nauticalTwilightEnd)
        self.astronomicalTwilightBegin = try container.decode(String.self, forKey: .astronomicalTwilightBegin)
        self.astronomicalTwilightEnd = try container.decode(String.self, forKey: .astronomicalTwilightEnd)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.goldenHourBegin, forKey: .goldenHourBegin)
        try container.encode(self.goldenHourEnd, forKey: .goldenHourEnd)
        try container.encode(self.blueHourBegin, forKey: .blueHourBegin)
        try container.encode(self.blueHourEnd, forKey: .blueHourEnd)
        try container.encode(self.civilTwilightBegin, forKey: .civilTwilightBegin)
        try container.encode(self.civilTwilightEnd, forKey: .civilTwilightEnd)
        try container.encode(self.nauticalTwilightBegin, forKey: .nauticalTwilightBegin)
        try container.encode(self.nauticalTwilightEnd, forKey: .nauticalTwilightEnd)
        try container.encode(self.astronomicalTwilightBegin, forKey: .astronomicalTwilightBegin)
        try container.encode(self.astronomicalTwilightEnd, forKey: .astronomicalTwilightEnd)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case goldenHourBegin = "golden_hour_begin"
        case goldenHourEnd = "golden_hour_end"
        case blueHourBegin = "blue_hour_begin"
        case blueHourEnd = "blue_hour_end"
        case civilTwilightBegin = "civil_twilight_begin"
        case civilTwilightEnd = "civil_twilight_end"
        case nauticalTwilightBegin = "nautical_twilight_begin"
        case nauticalTwilightEnd = "nautical_twilight_end"
        case astronomicalTwilightBegin = "astronomical_twilight_begin"
        case astronomicalTwilightEnd = "astronomical_twilight_end"
    }
}