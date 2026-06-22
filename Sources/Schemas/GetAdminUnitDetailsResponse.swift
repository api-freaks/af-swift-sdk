import Foundation

public struct GetAdminUnitDetailsResponse: Codable, Hashable, Sendable {
    public let name: String
    public let adminCode: String
    public let adminLevel: String
    public let adminIso31662: String
    public let countryIso31662: String
    public let countryName: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        adminCode: String,
        adminLevel: String,
        adminIso31662: String,
        countryIso31662: String,
        countryName: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.adminCode = adminCode
        self.adminLevel = adminLevel
        self.adminIso31662 = adminIso31662
        self.countryIso31662 = countryIso31662
        self.countryName = countryName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.adminCode = try container.decode(String.self, forKey: .adminCode)
        self.adminLevel = try container.decode(String.self, forKey: .adminLevel)
        self.adminIso31662 = try container.decode(String.self, forKey: .adminIso31662)
        self.countryIso31662 = try container.decode(String.self, forKey: .countryIso31662)
        self.countryName = try container.decode(String.self, forKey: .countryName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.adminCode, forKey: .adminCode)
        try container.encode(self.adminLevel, forKey: .adminLevel)
        try container.encode(self.adminIso31662, forKey: .adminIso31662)
        try container.encode(self.countryIso31662, forKey: .countryIso31662)
        try container.encode(self.countryName, forKey: .countryName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case adminCode = "admin_code"
        case adminLevel = "admin_level"
        case adminIso31662 = "admin_iso3166_2"
        case countryIso31662 = "country_iso3166_2"
        case countryName = "country_name"
    }
}