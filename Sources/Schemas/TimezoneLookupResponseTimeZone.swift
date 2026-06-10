import Foundation

public struct TimezoneLookupResponseTimeZone: Codable, Hashable, Sendable {
    public let name: String
    public let offset: Double
    public let offsetWithDst: Double
    public let date: String
    public let dateTime: String
    public let dateTimeTxt: String
    public let dateTimeWti: String
    public let dateTimeYmd: String
    public let dateTimeUnix: Double
    public let time24: String
    public let time12: String
    public let week: Double
    public let month: Double
    public let year: Double
    public let yearAbbr: String
    public let currentTzAbbreviation: String
    public let currentTzFullName: String
    public let standardTzAbbreviation: String
    public let standardTzFullName: String
    public let isDst: Bool
    public let dstSavings: Double
    public let dstExists: Bool
    public let dstStart: TimezoneLookupResponseTimeZoneDstStart?
    public let dstEnd: TimezoneLookupResponseTimeZoneDstEnd?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        offset: Double,
        offsetWithDst: Double,
        date: String,
        dateTime: String,
        dateTimeTxt: String,
        dateTimeWti: String,
        dateTimeYmd: String,
        dateTimeUnix: Double,
        time24: String,
        time12: String,
        week: Double,
        month: Double,
        year: Double,
        yearAbbr: String,
        currentTzAbbreviation: String,
        currentTzFullName: String,
        standardTzAbbreviation: String,
        standardTzFullName: String,
        isDst: Bool,
        dstSavings: Double,
        dstExists: Bool,
        dstStart: TimezoneLookupResponseTimeZoneDstStart? = nil,
        dstEnd: TimezoneLookupResponseTimeZoneDstEnd? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.offset = offset
        self.offsetWithDst = offsetWithDst
        self.date = date
        self.dateTime = dateTime
        self.dateTimeTxt = dateTimeTxt
        self.dateTimeWti = dateTimeWti
        self.dateTimeYmd = dateTimeYmd
        self.dateTimeUnix = dateTimeUnix
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
        self.dstSavings = dstSavings
        self.dstExists = dstExists
        self.dstStart = dstStart
        self.dstEnd = dstEnd
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.offset = try container.decode(Double.self, forKey: .offset)
        self.offsetWithDst = try container.decode(Double.self, forKey: .offsetWithDst)
        self.date = try container.decode(String.self, forKey: .date)
        self.dateTime = try container.decode(String.self, forKey: .dateTime)
        self.dateTimeTxt = try container.decode(String.self, forKey: .dateTimeTxt)
        self.dateTimeWti = try container.decode(String.self, forKey: .dateTimeWti)
        self.dateTimeYmd = try container.decode(String.self, forKey: .dateTimeYmd)
        self.dateTimeUnix = try container.decode(Double.self, forKey: .dateTimeUnix)
        self.time24 = try container.decode(String.self, forKey: .time24)
        self.time12 = try container.decode(String.self, forKey: .time12)
        self.week = try container.decode(Double.self, forKey: .week)
        self.month = try container.decode(Double.self, forKey: .month)
        self.year = try container.decode(Double.self, forKey: .year)
        self.yearAbbr = try container.decode(String.self, forKey: .yearAbbr)
        self.currentTzAbbreviation = try container.decode(String.self, forKey: .currentTzAbbreviation)
        self.currentTzFullName = try container.decode(String.self, forKey: .currentTzFullName)
        self.standardTzAbbreviation = try container.decode(String.self, forKey: .standardTzAbbreviation)
        self.standardTzFullName = try container.decode(String.self, forKey: .standardTzFullName)
        self.isDst = try container.decode(Bool.self, forKey: .isDst)
        self.dstSavings = try container.decode(Double.self, forKey: .dstSavings)
        self.dstExists = try container.decode(Bool.self, forKey: .dstExists)
        self.dstStart = try container.decodeIfPresent(TimezoneLookupResponseTimeZoneDstStart.self, forKey: .dstStart)
        self.dstEnd = try container.decodeIfPresent(TimezoneLookupResponseTimeZoneDstEnd.self, forKey: .dstEnd)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.offset, forKey: .offset)
        try container.encode(self.offsetWithDst, forKey: .offsetWithDst)
        try container.encode(self.date, forKey: .date)
        try container.encode(self.dateTime, forKey: .dateTime)
        try container.encode(self.dateTimeTxt, forKey: .dateTimeTxt)
        try container.encode(self.dateTimeWti, forKey: .dateTimeWti)
        try container.encode(self.dateTimeYmd, forKey: .dateTimeYmd)
        try container.encode(self.dateTimeUnix, forKey: .dateTimeUnix)
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
        case date
        case dateTime = "date_time"
        case dateTimeTxt = "date_time_txt"
        case dateTimeWti = "date_time_wti"
        case dateTimeYmd = "date_time_ymd"
        case dateTimeUnix = "date_time_unix"
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
        case dstSavings = "dst_savings"
        case dstExists = "dst_exists"
        case dstStart = "dst_start"
        case dstEnd = "dst_end"
    }
}