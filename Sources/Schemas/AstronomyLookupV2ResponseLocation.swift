import Foundation

/// Geographic location information for the astronomy calculation. The set of populated fields depends on which lookup mode the request used: (1) location param (geocode-by-address) returns location_string plus a basic field set (country_name, state_prov, city, locality, latitude, longitude, elevation); (2) lat + long params (geocode-by-coordinates) returns the same basic field set minus location_string, and locality may be an empty string when the coordinates don't resolve to a named sub-area; (3) ip param, or no location/lat/long/ip param at all (falls back to geo-IP lookup of the client's IP), returns the full geo-IP field set — continent_code, continent_name, country_code2, country_code3, country_name_official, is_eu, state_code, district, zipcode — in addition to the basic fields, but never location_string. elevation can be an empty string when elevation data is unavailable for the resolved location.
public struct AstronomyLookupV2ResponseLocation: Codable, Hashable, Sendable {
    /// The location query parameter echoed back as-is. Present only for geocode-by-address lookups (location param); absent for lat/long and ip-based lookups.
    public let locationString: String?
    /// The two-letter code of the continent (e.g., "NA"). Geo-IP field only: present for ip param or default client-IP lookups; absent for location/lat/long geocode lookups.
    public let continentCode: String?
    /// The full name of the continent (e.g., "North America"). Geo-IP field only: present for ip param or default client-IP lookups; absent for location/lat/long geocode lookups.
    public let continentName: String?
    /// The ISO 3166-1 alpha-2 two-letter country code (e.g., "US"). Geo-IP field only: present for ip param or default client-IP lookups; absent for location/lat/long geocode lookups.
    public let countryCode2: String?
    /// The ISO 3166-1 alpha-3 three-letter country code (e.g., "USA"). Geo-IP field only: present for ip param or default client-IP lookups; absent for location/lat/long geocode lookups.
    public let countryCode3: String?
    /// The common name of the country (e.g., "United States"). Present in all lookup modes.
    public let countryName: String?
    /// The official full name of the country (e.g., "United States of America"). Geo-IP field only: present for ip param or default client-IP lookups; absent for location/lat/long geocode lookups.
    public let countryNameOfficial: String?
    /// Whether the country belongs to the European Union. Geo-IP field only: present for ip param or default client-IP lookups; absent for location/lat/long geocode lookups.
    public let isEu: Bool?
    /// Name of the state/province/region. Present in all lookup modes.
    public let stateProv: String?
    /// Code of the state/province/region. Geo-IP field only: present for ip param or default client-IP lookups; absent for location/lat/long geocode lookups.
    public let stateCode: String?
    /// Name of the district or county. Geo-IP field only: present for ip param or default client-IP lookups; absent for location/lat/long geocode lookups.
    public let district: String?
    /// Name of the city. Present in all lookup modes.
    public let city: String?
    /// ZIP/Postal code of the place. Geo-IP field only: present for ip param or default client-IP lookups; absent for location/lat/long geocode lookups.
    public let zipcode: String?
    /// The geographic latitude of the location. Present in all lookup modes.
    public let latitude: String
    /// The geographic longitude of the location. Present in all lookup modes.
    public let longitude: String
    /// Smaller area, part or region of a city. Present in all lookup modes, but may be an empty string for lat/long or geo-IP lookups when no named sub-area resolves.
    public let locality: String?
    /// The elevation of the geographical location, in meters. Present in all lookup modes, but may be an empty string when elevation data is unavailable for the resolved location.
    public let elevation: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        locationString: String? = nil,
        continentCode: String? = nil,
        continentName: String? = nil,
        countryCode2: String? = nil,
        countryCode3: String? = nil,
        countryName: String? = nil,
        countryNameOfficial: String? = nil,
        isEu: Bool? = nil,
        stateProv: String? = nil,
        stateCode: String? = nil,
        district: String? = nil,
        city: String? = nil,
        zipcode: String? = nil,
        latitude: String,
        longitude: String,
        locality: String? = nil,
        elevation: String? = nil,
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
        self.countryName = try container.decodeIfPresent(String.self, forKey: .countryName)
        self.countryNameOfficial = try container.decodeIfPresent(String.self, forKey: .countryNameOfficial)
        self.isEu = try container.decodeIfPresent(Bool.self, forKey: .isEu)
        self.stateProv = try container.decodeIfPresent(String.self, forKey: .stateProv)
        self.stateCode = try container.decodeIfPresent(String.self, forKey: .stateCode)
        self.district = try container.decodeIfPresent(String.self, forKey: .district)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.zipcode = try container.decodeIfPresent(String.self, forKey: .zipcode)
        self.latitude = try container.decode(String.self, forKey: .latitude)
        self.longitude = try container.decode(String.self, forKey: .longitude)
        self.locality = try container.decodeIfPresent(String.self, forKey: .locality)
        self.elevation = try container.decodeIfPresent(String.self, forKey: .elevation)
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
        try container.encodeIfPresent(self.countryName, forKey: .countryName)
        try container.encodeIfPresent(self.countryNameOfficial, forKey: .countryNameOfficial)
        try container.encodeIfPresent(self.isEu, forKey: .isEu)
        try container.encodeIfPresent(self.stateProv, forKey: .stateProv)
        try container.encodeIfPresent(self.stateCode, forKey: .stateCode)
        try container.encodeIfPresent(self.district, forKey: .district)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.zipcode, forKey: .zipcode)
        try container.encode(self.latitude, forKey: .latitude)
        try container.encode(self.longitude, forKey: .longitude)
        try container.encodeIfPresent(self.locality, forKey: .locality)
        try container.encodeIfPresent(self.elevation, forKey: .elevation)
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