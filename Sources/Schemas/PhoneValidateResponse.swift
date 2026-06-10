import Foundation

public struct PhoneValidateResponse: Codable, Hashable, Sendable {
    /// The original request data provided by the client.
    public let rawInput: PhoneValidateResponseRawInput?
    /// Whether the number passes length and format checks.
    public let possible: Bool?
    /// Whether the number is valid according to the numbering plan.
    public let valid: Bool?
    /// International dialing prefix for the number's country.
    public let countryPrefix: Int?
    /// National significant number without the country code.
    public let nationalNumber: Int?
    /// ISO-2 country code inferred from the number.
    public let countryCode: String?
    /// Carrier name associated with the number.
    public let carrier: String?
    /// Geographic description (city/region) for the number.
    public let location: String?
    /// Array of possible IANA time zones associated with the number.
    public let timeZones: [String]?
    /// Classification of the phone line.
    public let lineType: PhoneValidateResponseLineType?
    /// The number represented in four standardized formats. Only returned for valid numbers.
    public let formats: PhoneValidateResponseFormats?
    /// Length of the geographic area code. Only for geographically-assigned numbers.
    public let areaCodeLength: Int?
    /// Length of the National Destination Code.
    public let ndcLength: Int?
    /// Whether the number can be dialled internationally.
    public let canBeInternationallyDialled: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        rawInput: PhoneValidateResponseRawInput? = nil,
        possible: Bool? = nil,
        valid: Bool? = nil,
        countryPrefix: Int? = nil,
        nationalNumber: Int? = nil,
        countryCode: String? = nil,
        carrier: String? = nil,
        location: String? = nil,
        timeZones: [String]? = nil,
        lineType: PhoneValidateResponseLineType? = nil,
        formats: PhoneValidateResponseFormats? = nil,
        areaCodeLength: Int? = nil,
        ndcLength: Int? = nil,
        canBeInternationallyDialled: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.rawInput = rawInput
        self.possible = possible
        self.valid = valid
        self.countryPrefix = countryPrefix
        self.nationalNumber = nationalNumber
        self.countryCode = countryCode
        self.carrier = carrier
        self.location = location
        self.timeZones = timeZones
        self.lineType = lineType
        self.formats = formats
        self.areaCodeLength = areaCodeLength
        self.ndcLength = ndcLength
        self.canBeInternationallyDialled = canBeInternationallyDialled
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.rawInput = try container.decodeIfPresent(PhoneValidateResponseRawInput.self, forKey: .rawInput)
        self.possible = try container.decodeIfPresent(Bool.self, forKey: .possible)
        self.valid = try container.decodeIfPresent(Bool.self, forKey: .valid)
        self.countryPrefix = try container.decodeIfPresent(Int.self, forKey: .countryPrefix)
        self.nationalNumber = try container.decodeIfPresent(Int.self, forKey: .nationalNumber)
        self.countryCode = try container.decodeIfPresent(String.self, forKey: .countryCode)
        self.carrier = try container.decodeIfPresent(String.self, forKey: .carrier)
        self.location = try container.decodeIfPresent(String.self, forKey: .location)
        self.timeZones = try container.decodeIfPresent([String].self, forKey: .timeZones)
        self.lineType = try container.decodeIfPresent(PhoneValidateResponseLineType.self, forKey: .lineType)
        self.formats = try container.decodeIfPresent(PhoneValidateResponseFormats.self, forKey: .formats)
        self.areaCodeLength = try container.decodeIfPresent(Int.self, forKey: .areaCodeLength)
        self.ndcLength = try container.decodeIfPresent(Int.self, forKey: .ndcLength)
        self.canBeInternationallyDialled = try container.decodeIfPresent(Bool.self, forKey: .canBeInternationallyDialled)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.rawInput, forKey: .rawInput)
        try container.encodeIfPresent(self.possible, forKey: .possible)
        try container.encodeIfPresent(self.valid, forKey: .valid)
        try container.encodeIfPresent(self.countryPrefix, forKey: .countryPrefix)
        try container.encodeIfPresent(self.nationalNumber, forKey: .nationalNumber)
        try container.encodeIfPresent(self.countryCode, forKey: .countryCode)
        try container.encodeIfPresent(self.carrier, forKey: .carrier)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.timeZones, forKey: .timeZones)
        try container.encodeIfPresent(self.lineType, forKey: .lineType)
        try container.encodeIfPresent(self.formats, forKey: .formats)
        try container.encodeIfPresent(self.areaCodeLength, forKey: .areaCodeLength)
        try container.encodeIfPresent(self.ndcLength, forKey: .ndcLength)
        try container.encodeIfPresent(self.canBeInternationallyDialled, forKey: .canBeInternationallyDialled)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case rawInput = "raw_input"
        case possible
        case valid
        case countryPrefix = "country_prefix"
        case nationalNumber = "national_number"
        case countryCode = "country_code"
        case carrier
        case location
        case timeZones = "time_zones"
        case lineType = "line_type"
        case formats
        case areaCodeLength = "area_code_length"
        case ndcLength = "ndc_length"
        case canBeInternationallyDialled = "can_be_internationally_dialled"
    }
}