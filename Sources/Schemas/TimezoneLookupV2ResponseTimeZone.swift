import Foundation

/// Timezone and date/time information for the location.
public struct TimezoneLookupV2ResponseTimeZone: Codable, Hashable, Sendable {
    /// The IANA timezone name/identifier for the location.
    public let name: String
    /// The Standard time zone offset from UTC in hours.
    public let offset: Float
    /// The time zone offset from UTC in hours, accounting for DST.
    public let offsetWithDst: Float
    /// The current date and time with timezone offset in YYYY-MM-DD HH:mm:ss.SSS±ZZZZ format.
    public let currentTime: String
    /// The Unix timestamp representing the date and time in seconds.
    public let currentTimeUnix: Float
    /// The current date in YYYY-MM-DD format.
    public let date: String
    /// The current date and time in YYYY-MM-DD HH:mm:ss format.
    public let dateTime: String
    /// The current date and time in descriptive format EEEE, MMMM dd, yyyy HH:mm:ss.
    public let dateTimeTxt: String
    /// The date and time with time zone information in EEE, dd MMM yyyy HH:mm:ss Z format.
    public let dateTimeWti: String
    /// The date and time with timezone offset in ISO 8601 format YYYY-MM-DDTHH:mm:ss±HHMM.
    public let dateTimeYmd: String
    /// The current time in 24-hour format HH:mm:ss.
    public let time24: String
    /// The current time in 12-hour format with AM/PM notation.
    public let time12: String
    /// The week number of the year (1-52).
    public let week: Int
    /// The current month as a number (1-12).
    public let month: Int
    /// The four-digit current year.
    public let year: Int
    /// The two-digit abbreviation for the year.
    public let yearAbbr: String
    /// Abbreviation of the time zone currently in effect (standard or DST).
    public let currentTzAbbreviation: String
    /// Full name of the time zone currently in effect.
    public let currentTzFullName: String
    /// Abbreviation of the standard (non-DST) time zone.
    public let standardTzAbbreviation: String
    /// Full name of the standard (non-DST) time zone.
    public let standardTzFullName: String
    /// Is the time zone in daylight savings?
    public let isDst: Bool
    /// Abbreviation of the DST time zone. Always present as a key; holds an empty string when dst_exists is false.
    public let dstTzAbbreviation: String?
    /// Full name of the DST time zone. Always present as a key; holds an empty string when dst_exists is false.
    public let dstTzFullName: String?
    /// The amount of time added for daylight saving in hours.
    public let dstSavings: Float
    /// Indicates whether DST is observed in the region.
    public let dstExists: Bool
    /// DST transition details (used for both the DST start and DST end transitions). Always present as a key on the parent TimeZone object; returned as an empty object {} when dst_exists is false, so none of its properties are required.
    public let dstStart: TimezoneLookupV2ResponseTimeZoneDstStart?
    /// DST transition details (used for both the DST start and DST end transitions). Always present as a key on the parent TimeZone object; returned as an empty object {} when dst_exists is false, so none of its properties are required.
    public let dstEnd: TimezoneLookupV2ResponseTimeZoneDstEnd?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        offset: Float,
        offsetWithDst: Float,
        currentTime: String,
        currentTimeUnix: Float,
        date: String,
        dateTime: String,
        dateTimeTxt: String,
        dateTimeWti: String,
        dateTimeYmd: String,
        time24: String,
        time12: String,
        week: Int,
        month: Int,
        year: Int,
        yearAbbr: String,
        currentTzAbbreviation: String,
        currentTzFullName: String,
        standardTzAbbreviation: String,
        standardTzFullName: String,
        isDst: Bool,
        dstTzAbbreviation: String? = nil,
        dstTzFullName: String? = nil,
        dstSavings: Float,
        dstExists: Bool,
        dstStart: TimezoneLookupV2ResponseTimeZoneDstStart? = nil,
        dstEnd: TimezoneLookupV2ResponseTimeZoneDstEnd? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.offset = offset
        self.offsetWithDst = offsetWithDst
        self.currentTime = currentTime
        self.currentTimeUnix = currentTimeUnix
        self.date = date
        self.dateTime = dateTime
        self.dateTimeTxt = dateTimeTxt
        self.dateTimeWti = dateTimeWti
        self.dateTimeYmd = dateTimeYmd
        self.time24 = time24
        self.time12 = time12
        self.week = week
        self.month = month
        self.year = year
        self.yearAbbr = yearAbbr
        self.currentTzAbbreviation = currentTzAbbreviation
        self.currentTzFullName = currentTzFullName
        self.standardTzAbbreviation = standardTzAbbreviation
        self.standardTzFullName = standardTzFullName
        self.isDst = isDst
        self.dstTzAbbreviation = dstTzAbbreviation
        self.dstTzFullName = dstTzFullName
        self.dstSavings = dstSavings
        self.dstExists = dstExists
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
        self.date = try container.decode(String.self, forKey: .date)
        self.dateTime = try container.decode(String.self, forKey: .dateTime)
        self.dateTimeTxt = try container.decode(String.self, forKey: .dateTimeTxt)
        self.dateTimeWti = try container.decode(String.self, forKey: .dateTimeWti)
        self.dateTimeYmd = try container.decode(String.self, forKey: .dateTimeYmd)
        self.time24 = try container.decode(String.self, forKey: .time24)
        self.time12 = try container.decode(String.self, forKey: .time12)
        self.week = try container.decode(Int.self, forKey: .week)
        self.month = try container.decode(Int.self, forKey: .month)
        self.year = try container.decode(Int.self, forKey: .year)
        self.yearAbbr = try container.decode(String.self, forKey: .yearAbbr)
        self.currentTzAbbreviation = try container.decode(String.self, forKey: .currentTzAbbreviation)
        self.currentTzFullName = try container.decode(String.self, forKey: .currentTzFullName)
        self.standardTzAbbreviation = try container.decode(String.self, forKey: .standardTzAbbreviation)
        self.standardTzFullName = try container.decode(String.self, forKey: .standardTzFullName)
        self.isDst = try container.decode(Bool.self, forKey: .isDst)
        self.dstTzAbbreviation = try container.decodeIfPresent(String.self, forKey: .dstTzAbbreviation)
        self.dstTzFullName = try container.decodeIfPresent(String.self, forKey: .dstTzFullName)
        self.dstSavings = try container.decode(Float.self, forKey: .dstSavings)
        self.dstExists = try container.decode(Bool.self, forKey: .dstExists)
        self.dstStart = try container.decodeIfPresent(TimezoneLookupV2ResponseTimeZoneDstStart.self, forKey: .dstStart)
        self.dstEnd = try container.decodeIfPresent(TimezoneLookupV2ResponseTimeZoneDstEnd.self, forKey: .dstEnd)
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
        try container.encode(self.date, forKey: .date)
        try container.encode(self.dateTime, forKey: .dateTime)
        try container.encode(self.dateTimeTxt, forKey: .dateTimeTxt)
        try container.encode(self.dateTimeWti, forKey: .dateTimeWti)
        try container.encode(self.dateTimeYmd, forKey: .dateTimeYmd)
        try container.encode(self.time24, forKey: .time24)
        try container.encode(self.time12, forKey: .time12)
        try container.encode(self.week, forKey: .week)
        try container.encode(self.month, forKey: .month)
        try container.encode(self.year, forKey: .year)
        try container.encode(self.yearAbbr, forKey: .yearAbbr)
        try container.encode(self.currentTzAbbreviation, forKey: .currentTzAbbreviation)
        try container.encode(self.currentTzFullName, forKey: .currentTzFullName)
        try container.encode(self.standardTzAbbreviation, forKey: .standardTzAbbreviation)
        try container.encode(self.standardTzFullName, forKey: .standardTzFullName)
        try container.encode(self.isDst, forKey: .isDst)
        try container.encodeIfPresent(self.dstTzAbbreviation, forKey: .dstTzAbbreviation)
        try container.encodeIfPresent(self.dstTzFullName, forKey: .dstTzFullName)
        try container.encode(self.dstSavings, forKey: .dstSavings)
        try container.encode(self.dstExists, forKey: .dstExists)
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
        case date
        case dateTime = "date_time"
        case dateTimeTxt = "date_time_txt"
        case dateTimeWti = "date_time_wti"
        case dateTimeYmd = "date_time_ymd"
        case time24 = "time_24"
        case time12 = "time_12"
        case week
        case month
        case year
        case yearAbbr = "year_abbr"
        case currentTzAbbreviation = "current_tz_abbreviation"
        case currentTzFullName = "current_tz_full_name"
        case standardTzAbbreviation = "standard_tz_abbreviation"
        case standardTzFullName = "standard_tz_full_name"
        case isDst = "is_dst"
        case dstTzAbbreviation = "dst_tz_abbreviation"
        case dstTzFullName = "dst_tz_full_name"
        case dstSavings = "dst_savings"
        case dstExists = "dst_exists"
        case dstStart = "dst_start"
        case dstEnd = "dst_end"
    }
}