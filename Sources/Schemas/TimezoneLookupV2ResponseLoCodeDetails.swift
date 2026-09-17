import Foundation

/// UN/LOCODE location details, present when queried by LO code.
public struct TimezoneLookupV2ResponseLoCodeDetails: Codable, Hashable, Sendable {
    /// A unique identifier for the location, often used in logistics and shipping (e.g., USNYC).
    public let loCode: String?
    /// The name of the city or location associated with the LO code.
    public let city: String?
    /// The code for the state, province or region.
    public let stateCode: String?
    /// The ISO 3166-1 alpha-2 country code (e.g., US).
    public let countryCode: String?
    /// The name of the country in an administrative context.
    public let countryName: String?
    /// The type of location as comma-separated list of facilities (e.g., Port, Rail Terminal, Road Terminal, Airport).
    public let locationType: String?
    /// The latitude coordinate of the location.
    public let latitude: String?
    /// The longitude coordinate of the location.
    public let longitude: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        loCode: String? = nil,
        city: String? = nil,
        stateCode: String? = nil,
        countryCode: String? = nil,
        countryName: String? = nil,
        locationType: String? = nil,
        latitude: String? = nil,
        longitude: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.loCode = loCode
        self.city = city
        self.stateCode = stateCode
        self.countryCode = countryCode
        self.countryName = countryName
        self.locationType = locationType
        self.latitude = latitude
        self.longitude = longitude
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.loCode = try container.decodeIfPresent(String.self, forKey: .loCode)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.stateCode = try container.decodeIfPresent(String.self, forKey: .stateCode)
        self.countryCode = try container.decodeIfPresent(String.self, forKey: .countryCode)
        self.countryName = try container.decodeIfPresent(String.self, forKey: .countryName)
        self.locationType = try container.decodeIfPresent(String.self, forKey: .locationType)
        self.latitude = try container.decodeIfPresent(String.self, forKey: .latitude)
        self.longitude = try container.decodeIfPresent(String.self, forKey: .longitude)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.loCode, forKey: .loCode)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.stateCode, forKey: .stateCode)
        try container.encodeIfPresent(self.countryCode, forKey: .countryCode)
        try container.encodeIfPresent(self.countryName, forKey: .countryName)
        try container.encodeIfPresent(self.locationType, forKey: .locationType)
        try container.encodeIfPresent(self.latitude, forKey: .latitude)
        try container.encodeIfPresent(self.longitude, forKey: .longitude)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case loCode = "lo_code"
        case city
        case stateCode = "state_code"
        case countryCode = "country_code"
        case countryName = "country_name"
        case locationType = "location_type"
        case latitude
        case longitude
    }
}