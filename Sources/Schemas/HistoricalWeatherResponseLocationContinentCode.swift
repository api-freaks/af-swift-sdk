import Foundation

public struct HistoricalWeatherResponseLocationContinentCode: Codable, Hashable, Sendable {
    /// Two-letter continent code (e.g., NA for North America, EU for Europe, AS for Asia).
    public let continentCode: String
    /// Full name of the continent where the IP address is registered.
    public let continentName: String
    /// ISO 3166-1 alpha-2 two-letter country code (e.g., US, GB, FR).
    public let countryCode2: String
    /// ISO 3166-1 alpha-3 three-letter country code (e.g., USA, GBR, FRA).
    public let countryCode3: String
    /// Common name of the country associated with the IP address.
    public let countryName: String
    /// Official long-form country name as recognized internationally (e.g., United States of America).
    public let countryNameOfficial: String
    /// Boolean flag indicating whether the country is a member state of the European Union.
    public let isEu: Bool?
    /// State, province, or primary administrative division associated with the IP location.
    public let stateProv: String
    /// ISO 3166-2 subdivision code for the state or province (e.g., CA for California).
    public let stateCode: String?
    /// District, county, or secondary administrative division within the region.
    public let district: String?
    /// City or urban area name where the IP address is geographically registered.
    public let city: String
    /// Postal code or ZIP code for the approximate location of the IP address.
    public let zipcode: String?
    /// Geographic latitude in decimal degrees for the IP geolocation, ranging from -90 to +90.
    public let latitude: Float
    /// Geographic longitude in decimal degrees for the IP geolocation, ranging from -180 to +180.
    public let longitude: Float
    /// Specific locality, neighborhood, or small area designation within the city.
    public let locality: String?
    /// Elevation above mean sea level in meters for the IP geolocation.
    public let elevation: Float?
    /// IANA timezone database identifier for the IP location (e.g., America/Chicago, Asia/Tokyo).
    public let timezone: String
    /// Current timezone abbreviation based on local offset (e.g., CST, JST, UTC).
    public let timezoneAbbreviation: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        continentCode: String,
        continentName: String,
        countryCode2: String,
        countryCode3: String,
        countryName: String,
        countryNameOfficial: String,
        isEu: Bool? = nil,
        stateProv: String,
        stateCode: String? = nil,
        district: String? = nil,
        city: String,
        zipcode: String? = nil,
        latitude: Float,
        longitude: Float,
        locality: String? = nil,
        elevation: Float? = nil,
        timezone: String,
        timezoneAbbreviation: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
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
        self.timezone = timezone
        self.timezoneAbbreviation = timezoneAbbreviation
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.continentCode = try container.decode(String.self, forKey: .continentCode)
        self.continentName = try container.decode(String.self, forKey: .continentName)
        self.countryCode2 = try container.decode(String.self, forKey: .countryCode2)
        self.countryCode3 = try container.decode(String.self, forKey: .countryCode3)
        self.countryName = try container.decode(String.self, forKey: .countryName)
        self.countryNameOfficial = try container.decode(String.self, forKey: .countryNameOfficial)
        self.isEu = try container.decodeIfPresent(Bool.self, forKey: .isEu)
        self.stateProv = try container.decode(String.self, forKey: .stateProv)
        self.stateCode = try container.decodeIfPresent(String.self, forKey: .stateCode)
        self.district = try container.decodeIfPresent(String.self, forKey: .district)
        self.city = try container.decode(String.self, forKey: .city)
        self.zipcode = try container.decodeIfPresent(String.self, forKey: .zipcode)
        self.latitude = try container.decode(Float.self, forKey: .latitude)
        self.longitude = try container.decode(Float.self, forKey: .longitude)
        self.locality = try container.decodeIfPresent(String.self, forKey: .locality)
        self.elevation = try container.decodeIfPresent(Float.self, forKey: .elevation)
        self.timezone = try container.decode(String.self, forKey: .timezone)
        self.timezoneAbbreviation = try container.decode(String.self, forKey: .timezoneAbbreviation)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.continentCode, forKey: .continentCode)
        try container.encode(self.continentName, forKey: .continentName)
        try container.encode(self.countryCode2, forKey: .countryCode2)
        try container.encode(self.countryCode3, forKey: .countryCode3)
        try container.encode(self.countryName, forKey: .countryName)
        try container.encode(self.countryNameOfficial, forKey: .countryNameOfficial)
        try container.encodeIfPresent(self.isEu, forKey: .isEu)
        try container.encode(self.stateProv, forKey: .stateProv)
        try container.encodeIfPresent(self.stateCode, forKey: .stateCode)
        try container.encodeIfPresent(self.district, forKey: .district)
        try container.encode(self.city, forKey: .city)
        try container.encodeIfPresent(self.zipcode, forKey: .zipcode)
        try container.encode(self.latitude, forKey: .latitude)
        try container.encode(self.longitude, forKey: .longitude)
        try container.encodeIfPresent(self.locality, forKey: .locality)
        try container.encodeIfPresent(self.elevation, forKey: .elevation)
        try container.encode(self.timezone, forKey: .timezone)
        try container.encode(self.timezoneAbbreviation, forKey: .timezoneAbbreviation)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
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
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
    }
}