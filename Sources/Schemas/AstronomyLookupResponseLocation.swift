import Foundation

public struct AstronomyLookupResponseLocation: Codable, Hashable, Sendable {
    /// The complete geographical location (returned when looking up by the location parameter).
    public let locationString: String?
    public let continentCode: String?
    public let continentName: String?
    public let countryCode2: String?
    public let countryCode3: String?
    public let countryName: String
    public let countryNameOfficial: String?
    public let isEu: Bool?
    public let stateProv: String
    public let stateCode: String?
    public let district: String?
    public let city: String
    public let zipcode: String?
    public let latitude: String
    public let longitude: String
    public let locality: String
    public let elevation: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        locationString: String? = nil,
        continentCode: String? = nil,
        continentName: String? = nil,
        countryCode2: String? = nil,
        countryCode3: String? = nil,
        countryName: String,
        countryNameOfficial: String? = nil,
        isEu: Bool? = nil,
        stateProv: String,
        stateCode: String? = nil,
        district: String? = nil,
        city: String,
        zipcode: String? = nil,
        latitude: String,
        longitude: String,
        locality: String,
        elevation: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.locationString = locationString
        self.continentCode = continentCode
        self.continentName = continentName
        self.countryCode2 = countryCode2
        self.countryCode3 = countryCode3
        self.countryName = countryName
        self.countryNameOfficial = countryNameOfficial
        self.isEu = isEu
        self.stateProv = stateProv
        self.stateCode = stateCode
        self.district = district
        self.city = city
        self.zipcode = zipcode
        self.latitude = latitude
        self.longitude = longitude
        self.locality = locality
        self.elevation = elevation
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.locationString = try container.decodeIfPresent(String.self, forKey: .locationString)
        self.continentCode = try container.decodeIfPresent(String.self, forKey: .continentCode)
        self.continentName = try container.decodeIfPresent(String.self, forKey: .continentName)
        self.countryCode2 = try container.decodeIfPresent(String.self, forKey: .countryCode2)
        self.countryCode3 = try container.decodeIfPresent(String.self, forKey: .countryCode3)
        self.countryName = try container.decode(String.self, forKey: .countryName)
        self.countryNameOfficial = try container.decodeIfPresent(String.self, forKey: .countryNameOfficial)
        self.isEu = try container.decodeIfPresent(Bool.self, forKey: .isEu)
        self.stateProv = try container.decode(String.self, forKey: .stateProv)
        self.stateCode = try container.decodeIfPresent(String.self, forKey: .stateCode)
        self.district = try container.decodeIfPresent(String.self, forKey: .district)
        self.city = try container.decode(String.self, forKey: .city)
        self.zipcode = try container.decodeIfPresent(String.self, forKey: .zipcode)
        self.latitude = try container.decode(String.self, forKey: .latitude)
        self.longitude = try container.decode(String.self, forKey: .longitude)
        self.locality = try container.decode(String.self, forKey: .locality)
        self.elevation = try container.decode(String.self, forKey: .elevation)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.locationString, forKey: .locationString)
        try container.encodeIfPresent(self.continentCode, forKey: .continentCode)
        try container.encodeIfPresent(self.continentName, forKey: .continentName)
        try container.encodeIfPresent(self.countryCode2, forKey: .countryCode2)
        try container.encodeIfPresent(self.countryCode3, forKey: .countryCode3)
        try container.encode(self.countryName, forKey: .countryName)
        try container.encodeIfPresent(self.countryNameOfficial, forKey: .countryNameOfficial)
        try container.encodeIfPresent(self.isEu, forKey: .isEu)
        try container.encode(self.stateProv, forKey: .stateProv)
        try container.encodeIfPresent(self.stateCode, forKey: .stateCode)
        try container.encodeIfPresent(self.district, forKey: .district)
        try container.encode(self.city, forKey: .city)
        try container.encodeIfPresent(self.zipcode, forKey: .zipcode)
        try container.encode(self.latitude, forKey: .latitude)
        try container.encode(self.longitude, forKey: .longitude)
        try container.encode(self.locality, forKey: .locality)
        try container.encode(self.elevation, forKey: .elevation)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case locationString = "location_string"
        case continentCode = "continent_code"
        case continentName = "continent_name"
        case countryCode2 = "country_code2"
        case countryCode3 = "country_code3"
        case countryName = "country_name"
        case countryNameOfficial = "country_name_official"
        case isEu = "is_eu"
        case stateProv = "state_prov"
        case stateCode = "state_code"
        case district
        case city
        case zipcode
        case latitude
        case longitude
        case locality
        case elevation
    }
}