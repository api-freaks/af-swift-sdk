import Foundation

public struct TimezoneLookupResponseLocation: Codable, Hashable, Sendable {
    public let locationString: String?
    public let countryName: String?
    public let stateProv: String?
    public let city: String?
    public let locality: String?
    public let latitude: String?
    public let longitude: String?
    public let continentCode: String?
    public let continentName: String?
    public let countryCode2: String?
    public let countryCode3: String?
    public let countryNameOfficial: String?
    public let isEu: Bool?
    public let stateCode: String?
    public let district: String?
    public let zipcode: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        locationString: String? = nil,
        countryName: String? = nil,
        stateProv: String? = nil,
        city: String? = nil,
        locality: String? = nil,
        latitude: String? = nil,
        longitude: String? = nil,
        continentCode: String? = nil,
        continentName: String? = nil,
        countryCode2: String? = nil,
        countryCode3: String? = nil,
        countryNameOfficial: String? = nil,
        isEu: Bool? = nil,
        stateCode: String? = nil,
        district: String? = nil,
        zipcode: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.locationString = locationString
        self.countryName = countryName
        self.stateProv = stateProv
        self.city = city
        self.locality = locality
        self.latitude = latitude
        self.longitude = longitude
        self.continentCode = continentCode
        self.continentName = continentName
        self.countryCode2 = countryCode2
        self.countryCode3 = countryCode3
        self.countryNameOfficial = countryNameOfficial
        self.isEu = isEu
        self.stateCode = stateCode
        self.district = district
        self.zipcode = zipcode
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.locationString = try container.decodeIfPresent(String.self, forKey: .locationString)
        self.countryName = try container.decodeIfPresent(String.self, forKey: .countryName)
        self.stateProv = try container.decodeIfPresent(String.self, forKey: .stateProv)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.locality = try container.decodeIfPresent(String.self, forKey: .locality)
        self.latitude = try container.decodeIfPresent(String.self, forKey: .latitude)
        self.longitude = try container.decodeIfPresent(String.self, forKey: .longitude)
        self.continentCode = try container.decodeIfPresent(String.self, forKey: .continentCode)
        self.continentName = try container.decodeIfPresent(String.self, forKey: .continentName)
        self.countryCode2 = try container.decodeIfPresent(String.self, forKey: .countryCode2)
        self.countryCode3 = try container.decodeIfPresent(String.self, forKey: .countryCode3)
        self.countryNameOfficial = try container.decodeIfPresent(String.self, forKey: .countryNameOfficial)
        self.isEu = try container.decodeIfPresent(Bool.self, forKey: .isEu)
        self.stateCode = try container.decodeIfPresent(String.self, forKey: .stateCode)
        self.district = try container.decodeIfPresent(String.self, forKey: .district)
        self.zipcode = try container.decodeIfPresent(String.self, forKey: .zipcode)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.locationString, forKey: .locationString)
        try container.encodeIfPresent(self.countryName, forKey: .countryName)
        try container.encodeIfPresent(self.stateProv, forKey: .stateProv)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.locality, forKey: .locality)
        try container.encodeIfPresent(self.latitude, forKey: .latitude)
        try container.encodeIfPresent(self.longitude, forKey: .longitude)
        try container.encodeIfPresent(self.continentCode, forKey: .continentCode)
        try container.encodeIfPresent(self.continentName, forKey: .continentName)
        try container.encodeIfPresent(self.countryCode2, forKey: .countryCode2)
        try container.encodeIfPresent(self.countryCode3, forKey: .countryCode3)
        try container.encodeIfPresent(self.countryNameOfficial, forKey: .countryNameOfficial)
        try container.encodeIfPresent(self.isEu, forKey: .isEu)
        try container.encodeIfPresent(self.stateCode, forKey: .stateCode)
        try container.encodeIfPresent(self.district, forKey: .district)
        try container.encodeIfPresent(self.zipcode, forKey: .zipcode)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case locationString = "location_string"
        case countryName = "country_name"
        case stateProv = "state_prov"
        case city
        case locality
        case latitude
        case longitude
        case continentCode = "continent_code"
        case continentName = "continent_name"
        case countryCode2 = "country_code2"
        case countryCode3 = "country_code3"
        case countryNameOfficial = "country_name_official"
        case isEu = "is_eu"
        case stateCode = "state_code"
        case district
        case zipcode
    }
}