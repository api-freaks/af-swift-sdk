import Foundation

public struct TimezoneLookupResponseLoCodeDetails: Codable, Hashable, Sendable {
    public let loCode: String?
    public let city: String?
    public let longitude: Double?
    public let latitude: Double?
    public let stateCode: String?
    public let countryCode: String?
    public let countryName: String?
    public let locationType: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        loCode: String? = nil,
        city: String? = nil,
        longitude: Double? = nil,
        latitude: Double? = nil,
        stateCode: String? = nil,
        countryCode: String? = nil,
        countryName: String? = nil,
        locationType: String? = nil,
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
        self.loCode = try container.decodeIfPresent(String.self, forKey: .loCode)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.longitude = try container.decodeIfPresent(Double.self, forKey: .longitude)
        self.latitude = try container.decodeIfPresent(Double.self, forKey: .latitude)
        self.stateCode = try container.decodeIfPresent(String.self, forKey: .stateCode)
        self.countryCode = try container.decodeIfPresent(String.self, forKey: .countryCode)
        self.countryName = try container.decodeIfPresent(String.self, forKey: .countryName)
        self.locationType = try container.decodeIfPresent(String.self, forKey: .locationType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.loCode, forKey: .loCode)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.longitude, forKey: .longitude)
        try container.encodeIfPresent(self.latitude, forKey: .latitude)
        try container.encodeIfPresent(self.stateCode, forKey: .stateCode)
        try container.encodeIfPresent(self.countryCode, forKey: .countryCode)
        try container.encodeIfPresent(self.countryName, forKey: .countryName)
        try container.encodeIfPresent(self.locationType, forKey: .locationType)
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