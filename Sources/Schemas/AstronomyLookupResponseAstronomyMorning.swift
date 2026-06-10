import Foundation

public struct AstronomyLookupResponseAstronomyMorning: Codable, Hashable, Sendable {
    public let astronomicalTwilightBegin: String?
    public let astronomicalTwilightEnd: String?
    public let nauticalTwilightBegin: String?
    public let nauticalTwilightEnd: String?
    public let civilTwilightBegin: String?
    public let civilTwilightEnd: String?
    public let blueHourBegin: String?
    public let blueHourEnd: String?
    public let goldenHourBegin: String?
    public let goldenHourEnd: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        astronomicalTwilightBegin: String? = nil,
        astronomicalTwilightEnd: String? = nil,
        nauticalTwilightBegin: String? = nil,
        nauticalTwilightEnd: String? = nil,
        civilTwilightBegin: String? = nil,
        civilTwilightEnd: String? = nil,
        blueHourBegin: String? = nil,
        blueHourEnd: String? = nil,
        goldenHourBegin: String? = nil,
        goldenHourEnd: String? = nil,
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
        self.astronomicalTwilightBegin = try container.decodeIfPresent(String.self, forKey: .astronomicalTwilightBegin)
        self.astronomicalTwilightEnd = try container.decodeIfPresent(String.self, forKey: .astronomicalTwilightEnd)
        self.nauticalTwilightBegin = try container.decodeIfPresent(String.self, forKey: .nauticalTwilightBegin)
        self.nauticalTwilightEnd = try container.decodeIfPresent(String.self, forKey: .nauticalTwilightEnd)
        self.civilTwilightBegin = try container.decodeIfPresent(String.self, forKey: .civilTwilightBegin)
        self.civilTwilightEnd = try container.decodeIfPresent(String.self, forKey: .civilTwilightEnd)
        self.blueHourBegin = try container.decodeIfPresent(String.self, forKey: .blueHourBegin)
        self.blueHourEnd = try container.decodeIfPresent(String.self, forKey: .blueHourEnd)
        self.goldenHourBegin = try container.decodeIfPresent(String.self, forKey: .goldenHourBegin)
        self.goldenHourEnd = try container.decodeIfPresent(String.self, forKey: .goldenHourEnd)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.astronomicalTwilightBegin, forKey: .astronomicalTwilightBegin)
        try container.encodeIfPresent(self.astronomicalTwilightEnd, forKey: .astronomicalTwilightEnd)
        try container.encodeIfPresent(self.nauticalTwilightBegin, forKey: .nauticalTwilightBegin)
        try container.encodeIfPresent(self.nauticalTwilightEnd, forKey: .nauticalTwilightEnd)
        try container.encodeIfPresent(self.civilTwilightBegin, forKey: .civilTwilightBegin)
        try container.encodeIfPresent(self.civilTwilightEnd, forKey: .civilTwilightEnd)
        try container.encodeIfPresent(self.blueHourBegin, forKey: .blueHourBegin)
        try container.encodeIfPresent(self.blueHourEnd, forKey: .blueHourEnd)
        try container.encodeIfPresent(self.goldenHourBegin, forKey: .goldenHourBegin)
        try container.encodeIfPresent(self.goldenHourEnd, forKey: .goldenHourEnd)
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