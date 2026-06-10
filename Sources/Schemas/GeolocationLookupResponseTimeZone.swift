import Foundation

public struct GeolocationLookupResponseTimeZone: Codable, Hashable, Sendable {
    public let name: String?
    public let offset: Double?
    public let offsetWithDst: Double?
    public let currentTime: String?
    public let currentTimeUnix: Double?
    public let currentTzAbbreviation: String?
    public let currentTzFullName: String?
    public let standardTzAbbreviation: String?
    public let standardTzFullName: String?
    public let isDst: Bool?
    public let dstSavings: Double?
    public let dstExists: Bool?
    public let dstTzAbbreviation: String?
    public let dstTzFullName: String?
    public let dstStart: GeolocationLookupResponseTimeZoneDstStart?
    public let dstEnd: GeolocationLookupResponseTimeZoneDstEnd?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String? = nil,
        offset: Double? = nil,
        offsetWithDst: Double? = nil,
        currentTime: String? = nil,
        currentTimeUnix: Double? = nil,
        currentTzAbbreviation: String? = nil,
        currentTzFullName: String? = nil,
        standardTzAbbreviation: String? = nil,
        standardTzFullName: String? = nil,
        isDst: Bool? = nil,
        dstSavings: Double? = nil,
        dstExists: Bool? = nil,
        dstTzAbbreviation: String? = nil,
        dstTzFullName: String? = nil,
        dstStart: GeolocationLookupResponseTimeZoneDstStart? = nil,
        dstEnd: GeolocationLookupResponseTimeZoneDstEnd? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.offset = offset
        self.offsetWithDst = offsetWithDst
        self.currentTime = currentTime
        self.currentTimeUnix = currentTimeUnix
        self.currentTzAbbreviation = currentTzAbbreviation
        self.currentTzFullName = currentTzFullName
        self.standardTzAbbreviation = standardTzAbbreviation
        self.standardTzFullName = standardTzFullName
        self.isDst = isDst
        self.dstSavings = dstSavings
        self.dstExists = dstExists
        self.dstTzAbbreviation = dstTzAbbreviation
        self.dstTzFullName = dstTzFullName
        self.dstStart = dstStart
        self.dstEnd = dstEnd
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.offset = try container.decodeIfPresent(Double.self, forKey: .offset)
        self.offsetWithDst = try container.decodeIfPresent(Double.self, forKey: .offsetWithDst)
        self.currentTime = try container.decodeIfPresent(String.self, forKey: .currentTime)
        self.currentTimeUnix = try container.decodeIfPresent(Double.self, forKey: .currentTimeUnix)
        self.currentTzAbbreviation = try container.decodeIfPresent(String.self, forKey: .currentTzAbbreviation)
        self.currentTzFullName = try container.decodeIfPresent(String.self, forKey: .currentTzFullName)
        self.standardTzAbbreviation = try container.decodeIfPresent(String.self, forKey: .standardTzAbbreviation)
        self.standardTzFullName = try container.decodeIfPresent(String.self, forKey: .standardTzFullName)
        self.isDst = try container.decodeIfPresent(Bool.self, forKey: .isDst)
        self.dstSavings = try container.decodeIfPresent(Double.self, forKey: .dstSavings)
        self.dstExists = try container.decodeIfPresent(Bool.self, forKey: .dstExists)
        self.dstTzAbbreviation = try container.decodeIfPresent(String.self, forKey: .dstTzAbbreviation)
        self.dstTzFullName = try container.decodeIfPresent(String.self, forKey: .dstTzFullName)
        self.dstStart = try container.decodeIfPresent(GeolocationLookupResponseTimeZoneDstStart.self, forKey: .dstStart)
        self.dstEnd = try container.decodeIfPresent(GeolocationLookupResponseTimeZoneDstEnd.self, forKey: .dstEnd)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.offset, forKey: .offset)
        try container.encodeIfPresent(self.offsetWithDst, forKey: .offsetWithDst)
        try container.encodeIfPresent(self.currentTime, forKey: .currentTime)
        try container.encodeIfPresent(self.currentTimeUnix, forKey: .currentTimeUnix)
        try container.encodeIfPresent(self.currentTzAbbreviation, forKey: .currentTzAbbreviation)
        try container.encodeIfPresent(self.currentTzFullName, forKey: .currentTzFullName)
        try container.encodeIfPresent(self.standardTzAbbreviation, forKey: .standardTzAbbreviation)
        try container.encodeIfPresent(self.standardTzFullName, forKey: .standardTzFullName)
        try container.encodeIfPresent(self.isDst, forKey: .isDst)
        try container.encodeIfPresent(self.dstSavings, forKey: .dstSavings)
        try container.encodeIfPresent(self.dstExists, forKey: .dstExists)
        try container.encodeIfPresent(self.dstTzAbbreviation, forKey: .dstTzAbbreviation)
        try container.encodeIfPresent(self.dstTzFullName, forKey: .dstTzFullName)
        try container.encodeIfPresent(self.dstStart, forKey: .dstStart)
        try container.encodeIfPresent(self.dstEnd, forKey: .dstEnd)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case offset
        case offsetWithDst = "offset_with_dst"
        case currentTime = "current_time"
        case currentTimeUnix = "current_time_unix"
        case currentTzAbbreviation = "current_tz_abbreviation"
        case currentTzFullName = "current_tz_full_name"
        case standardTzAbbreviation = "standard_tz_abbreviation"
        case standardTzFullName = "standard_tz_full_name"
        case isDst = "is_dst"
        case dstSavings = "dst_savings"
        case dstExists = "dst_exists"
        case dstTzAbbreviation = "dst_tz_abbreviation"
        case dstTzFullName = "dst_tz_full_name"
        case dstStart = "dst_start"
        case dstEnd = "dst_end"
    }
}