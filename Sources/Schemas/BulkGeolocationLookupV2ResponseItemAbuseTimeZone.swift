import Foundation

/// Time zone information for the IP's location.
public struct BulkGeolocationLookupV2ResponseItemAbuseTimeZone: Codable, Hashable, Sendable {
    /// Time zone in IANA TZDB format.
    public let name: String
    /// Standard time UTC offset in hours.
    public let offset: Float
    /// Current effective UTC offset in hours, including DST.
    public let offsetWithDst: Float
    /// Local date/time in YYYY-MM-DD HH:mm:ss.SSS±ZZZZ format.
    public let currentTime: String
    /// Local time as Unix epoch seconds.
    public let currentTimeUnix: Float
    /// Current time zone abbreviation.
    public let currentTzAbbreviation: String?
    /// Current time zone full name.
    public let currentTzFullName: String?
    /// Standard (non-DST) abbreviation.
    public let standardTzAbbreviation: String?
    /// Standard (non-DST) full name.
    public let standardTzFullName: String?
    /// true if DST is active.
    public let isDst: Bool
    /// DST shift amount in hours.
    public let dstSavings: Float
    /// true if the time zone observes DST.
    public let dstExists: Bool
    /// DST abbreviation when DST is active.
    public let dstTzAbbreviation: String?
    /// DST full name when DST is active.
    public let dstTzFullName: String?
    /// DST transition details (used for both the DST start and DST end transitions).
    public let dstStart: BulkGeolocationLookupV2ResponseItemAbuseTimeZoneDstStart?
    /// DST transition details (used for both the DST start and DST end transitions).
    public let dstEnd: BulkGeolocationLookupV2ResponseItemAbuseTimeZoneDstEnd?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        offset: Float,
        offsetWithDst: Float,
        currentTime: String,
        currentTimeUnix: Float,
        currentTzAbbreviation: String? = nil,
        currentTzFullName: String? = nil,
        standardTzAbbreviation: String? = nil,
        standardTzFullName: String? = nil,
        isDst: Bool,
        dstSavings: Float,
        dstExists: Bool,
        dstTzAbbreviation: String? = nil,
        dstTzFullName: String? = nil,
        dstStart: BulkGeolocationLookupV2ResponseItemAbuseTimeZoneDstStart? = nil,
        dstEnd: BulkGeolocationLookupV2ResponseItemAbuseTimeZoneDstEnd? = nil,
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
        self.name = try container.decode(String.self, forKey: .name)
        self.offset = try container.decode(Float.self, forKey: .offset)
        self.offsetWithDst = try container.decode(Float.self, forKey: .offsetWithDst)
        self.currentTime = try container.decode(String.self, forKey: .currentTime)
        self.currentTimeUnix = try container.decode(Float.self, forKey: .currentTimeUnix)
        self.currentTzAbbreviation = try container.decodeIfPresent(String.self, forKey: .currentTzAbbreviation)
        self.currentTzFullName = try container.decodeIfPresent(String.self, forKey: .currentTzFullName)
        self.standardTzAbbreviation = try container.decodeIfPresent(String.self, forKey: .standardTzAbbreviation)
        self.standardTzFullName = try container.decodeIfPresent(String.self, forKey: .standardTzFullName)
        self.isDst = try container.decode(Bool.self, forKey: .isDst)
        self.dstSavings = try container.decode(Float.self, forKey: .dstSavings)
        self.dstExists = try container.decode(Bool.self, forKey: .dstExists)
        self.dstTzAbbreviation = try container.decodeIfPresent(String.self, forKey: .dstTzAbbreviation)
        self.dstTzFullName = try container.decodeIfPresent(String.self, forKey: .dstTzFullName)
        self.dstStart = try container.decodeIfPresent(BulkGeolocationLookupV2ResponseItemAbuseTimeZoneDstStart.self, forKey: .dstStart)
        self.dstEnd = try container.decodeIfPresent(BulkGeolocationLookupV2ResponseItemAbuseTimeZoneDstEnd.self, forKey: .dstEnd)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.offset, forKey: .offset)
        try container.encode(self.offsetWithDst, forKey: .offsetWithDst)
        try container.encode(self.currentTime, forKey: .currentTime)
        try container.encode(self.currentTimeUnix, forKey: .currentTimeUnix)
        try container.encodeIfPresent(self.currentTzAbbreviation, forKey: .currentTzAbbreviation)
        try container.encodeIfPresent(self.currentTzFullName, forKey: .currentTzFullName)
        try container.encodeIfPresent(self.standardTzAbbreviation, forKey: .standardTzAbbreviation)
        try container.encodeIfPresent(self.standardTzFullName, forKey: .standardTzFullName)
        try container.encode(self.isDst, forKey: .isDst)
        try container.encode(self.dstSavings, forKey: .dstSavings)
        try container.encode(self.dstExists, forKey: .dstExists)
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