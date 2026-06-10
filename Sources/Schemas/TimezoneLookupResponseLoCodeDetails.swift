import Foundation

public struct TimezoneLookupResponseLoCodeDetails: Codable, Hashable, Sendable {
    public let loCode: String
    public let city: String
    public let longitude: String
    public let latitude: String
    public let stateCode: String
    public let countryCode: String
    public let countryName: String
    public let locationType: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        loCode: String,
        city: String,
        longitude: String,
        latitude: String,
        stateCode: String,
        countryCode: String,
        countryName: String,
        locationType: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.loCode = loCode
        self.city = city
        self.longitude = longitude
        self.latitude = latitude
        self.stateCode = stateCode
        self.countryCode = countryCode
        self.countryName = countryName
        self.locationType = locationType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.loCode = try container.decode(String.self, forKey: .loCode)
        self.city = try container.decode(String.self, forKey: .city)
        self.longitude = try container.decode(String.self, forKey: .longitude)
        self.latitude = try container.decode(String.self, forKey: .latitude)
        self.stateCode = try container.decode(String.self, forKey: .stateCode)
        self.countryCode = try container.decode(String.self, forKey: .countryCode)
        self.countryName = try container.decode(String.self, forKey: .countryName)
        self.locationType = try container.decode(String.self, forKey: .locationType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.loCode, forKey: .loCode)
        try container.encode(self.city, forKey: .city)
        try container.encode(self.longitude, forKey: .longitude)
        try container.encode(self.latitude, forKey: .latitude)
        try container.encode(self.stateCode, forKey: .stateCode)
        try container.encode(self.countryCode, forKey: .countryCode)
        try container.encode(self.countryName, forKey: .countryName)
        try container.encode(self.locationType, forKey: .locationType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case loCode = "lo_code"
        case city
        case longitude
        case latitude
        case stateCode = "state_code"
        case countryCode = "country_code"
        case countryName = "country_name"
        case locationType = "location_type"
    }
}