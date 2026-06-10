import Foundation

public struct GetCountryDetailsResponse: Codable, Hashable, Sendable {
    public let name: String
    public let isoAlpha2: String
    public let isoAlpha3: String
    public let isoNumeric: Int
    public let phoneCode: Int
    public let capital: String
    public let topLevelDomain: String
    public let nativeName: String
    public let region: String
    public let subregion: String
    public let nationality: String
    public let flagEmoji: String
    public let currencyCode: String
    public let currencyName: String
    public let currencySymbol: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        isoAlpha2: String,
        isoAlpha3: String,
        isoNumeric: Int,
        phoneCode: Int,
        capital: String,
        topLevelDomain: String,
        nativeName: String,
        region: String,
        subregion: String,
        nationality: String,
        flagEmoji: String,
        currencyCode: String,
        currencyName: String,
        currencySymbol: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.isoAlpha2 = isoAlpha2
        self.isoAlpha3 = isoAlpha3
        self.isoNumeric = isoNumeric
        self.phoneCode = phoneCode
        self.capital = capital
        self.topLevelDomain = topLevelDomain
        self.nativeName = nativeName
        self.region = region
        self.subregion = subregion
        self.nationality = nationality
        self.flagEmoji = flagEmoji
        self.currencyCode = currencyCode
        self.currencyName = currencyName
        self.currencySymbol = currencySymbol
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.isoAlpha2 = try container.decode(String.self, forKey: .isoAlpha2)
        self.isoAlpha3 = try container.decode(String.self, forKey: .isoAlpha3)
        self.isoNumeric = try container.decode(Int.self, forKey: .isoNumeric)
        self.phoneCode = try container.decode(Int.self, forKey: .phoneCode)
        self.capital = try container.decode(String.self, forKey: .capital)
        self.topLevelDomain = try container.decode(String.self, forKey: .topLevelDomain)
        self.nativeName = try container.decode(String.self, forKey: .nativeName)
        self.region = try container.decode(String.self, forKey: .region)
        self.subregion = try container.decode(String.self, forKey: .subregion)
        self.nationality = try container.decode(String.self, forKey: .nationality)
        self.flagEmoji = try container.decode(String.self, forKey: .flagEmoji)
        self.currencyCode = try container.decode(String.self, forKey: .currencyCode)
        self.currencyName = try container.decode(String.self, forKey: .currencyName)
        self.currencySymbol = try container.decode(String.self, forKey: .currencySymbol)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.isoAlpha2, forKey: .isoAlpha2)
        try container.encode(self.isoAlpha3, forKey: .isoAlpha3)
        try container.encode(self.isoNumeric, forKey: .isoNumeric)
        try container.encode(self.phoneCode, forKey: .phoneCode)
        try container.encode(self.capital, forKey: .capital)
        try container.encode(self.topLevelDomain, forKey: .topLevelDomain)
        try container.encode(self.nativeName, forKey: .nativeName)
        try container.encode(self.region, forKey: .region)
        try container.encode(self.subregion, forKey: .subregion)
        try container.encode(self.nationality, forKey: .nationality)
        try container.encode(self.flagEmoji, forKey: .flagEmoji)
        try container.encode(self.currencyCode, forKey: .currencyCode)
        try container.encode(self.currencyName, forKey: .currencyName)
        try container.encode(self.currencySymbol, forKey: .currencySymbol)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case isoAlpha2 = "iso_alpha_2"
        case isoAlpha3 = "iso_alpha_3"
        case isoNumeric = "iso_numeric"
        case phoneCode = "phone_code"
        case capital
        case topLevelDomain = "top_level_domain"
        case nativeName = "native_name"
        case region
        case subregion
        case nationality
        case flagEmoji = "flag_emoji"
        case currencyCode = "currency_code"
        case currencyName = "currency_name"
        case currencySymbol = "currency_symbol"
    }
}