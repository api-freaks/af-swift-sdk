import Foundation

public struct HistoricalWeatherResponseLocationCity: Codable, Hashable, Sendable {
    /// Original location query string as submitted, including full address or place name.
    public let locationString: String
    /// Resolved country name derived from the geocoded location query.
    public let countryName: String
    /// State, province, or primary administrative division identified from the location.
    public let stateProv: String
    /// City or municipal area name extracted from the geocoded location.
    public let city: String
    /// Specific locality, neighborhood, suburb, or village within the geocoded area.
    public let locality: String?
    /// Geocoded latitude coordinate in decimal degrees, ranging from -90 to +90.
    public let latitude: Float
    /// Geocoded longitude coordinate in decimal degrees, ranging from -180 to +180.
    public let longitude: Float
    /// Elevation above mean sea level in meters at the geocoded coordinates.
    public let elevation: Float?
    /// IANA timezone database identifier for the geocoded location (e.g., America/Los_Angeles).
    public let timezone: String
    /// Current timezone abbreviation for the location based on local offset (e.g., PDT, CET).
    public let timezoneAbbreviation: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        locationString: String,
        countryName: String,
        stateProv: String,
        city: String,
        locality: String? = nil,
        latitude: Float,
        longitude: Float,
        elevation: Float? = nil,
        timezone: String,
        timezoneAbbreviation: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.locationString = locationString
        self.countryName = countryName
        self.stateProv = stateProv
        self.city = city
        self.locality = locality
        self.latitude = latitude
        self.longitude = longitude
        self.elevation = elevation
        self.timezone = timezone
        self.timezoneAbbreviation = timezoneAbbreviation
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.locationString = try container.decode(String.self, forKey: .locationString)
        self.countryName = try container.decode(String.self, forKey: .countryName)
        self.stateProv = try container.decode(String.self, forKey: .stateProv)
        self.city = try container.decode(String.self, forKey: .city)
        self.locality = try container.decodeIfPresent(String.self, forKey: .locality)
        self.latitude = try container.decode(Float.self, forKey: .latitude)
        self.longitude = try container.decode(Float.self, forKey: .longitude)
        self.elevation = try container.decodeIfPresent(Float.self, forKey: .elevation)
        self.timezone = try container.decode(String.self, forKey: .timezone)
        self.timezoneAbbreviation = try container.decode(String.self, forKey: .timezoneAbbreviation)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.locationString, forKey: .locationString)
        try container.encode(self.countryName, forKey: .countryName)
        try container.encode(self.stateProv, forKey: .stateProv)
        try container.encode(self.city, forKey: .city)
        try container.encodeIfPresent(self.locality, forKey: .locality)
        try container.encode(self.latitude, forKey: .latitude)
        try container.encode(self.longitude, forKey: .longitude)
        try container.encodeIfPresent(self.elevation, forKey: .elevation)
        try container.encode(self.timezone, forKey: .timezone)
        try container.encode(self.timezoneAbbreviation, forKey: .timezoneAbbreviation)
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
        case elevation
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
    }
}