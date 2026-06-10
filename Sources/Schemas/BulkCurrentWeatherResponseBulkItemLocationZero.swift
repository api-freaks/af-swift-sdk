import Foundation

public struct BulkCurrentWeatherResponseBulkItemLocationZero: Codable, Hashable, Sendable {
    /// Geographic latitude coordinate in decimal degrees, ranging from -90 (South Pole) to +90 (North Pole).
    public let latitude: Float
    /// Geographic longitude coordinate in decimal degrees, ranging from -180 (West) to +180 (East).
    public let longitude: Float
    /// Full name of the country corresponding to the provided coordinates.
    public let countryName: String
    /// State, province, or primary administrative division name for the location.
    public let stateProv: String
    /// City or municipal area name associated with the coordinate location.
    public let city: String
    /// Specific locality, neighborhood, district, or village name within the broader area.
    public let locality: String?
    /// Height above mean sea level in meters for the specified coordinates.
    public let elevation: Float?
    /// IANA timezone database identifier for the location (e.g., America/New_York, Europe/London).
    public let timezone: String
    /// Abbreviated timezone representation based on current offset (e.g., EST, GMT, PST).
    public let timezoneAbbreviation: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        latitude: Float,
        longitude: Float,
        countryName: String,
        stateProv: String,
        city: String,
        locality: String? = nil,
        elevation: Float? = nil,
        timezone: String,
        timezoneAbbreviation: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.latitude = latitude
        self.longitude = longitude
        self.countryName = countryName
        self.stateProv = stateProv
        self.city = city
        self.locality = locality
        self.elevation = elevation
        self.timezone = timezone
        self.timezoneAbbreviation = timezoneAbbreviation
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.latitude = try container.decode(Float.self, forKey: .latitude)
        self.longitude = try container.decode(Float.self, forKey: .longitude)
        self.countryName = try container.decode(String.self, forKey: .countryName)
        self.stateProv = try container.decode(String.self, forKey: .stateProv)
        self.city = try container.decode(String.self, forKey: .city)
        self.locality = try container.decodeIfPresent(String.self, forKey: .locality)
        self.elevation = try container.decodeIfPresent(Float.self, forKey: .elevation)
        self.timezone = try container.decode(String.self, forKey: .timezone)
        self.timezoneAbbreviation = try container.decode(String.self, forKey: .timezoneAbbreviation)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.latitude, forKey: .latitude)
        try container.encode(self.longitude, forKey: .longitude)
        try container.encode(self.countryName, forKey: .countryName)
        try container.encode(self.stateProv, forKey: .stateProv)
        try container.encode(self.city, forKey: .city)
        try container.encodeIfPresent(self.locality, forKey: .locality)
        try container.encodeIfPresent(self.elevation, forKey: .elevation)
        try container.encode(self.timezone, forKey: .timezone)
        try container.encode(self.timezoneAbbreviation, forKey: .timezoneAbbreviation)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case latitude
        case longitude
        case countryName = "country_name"
        case stateProv = "state_prov"
        case city
        case locality
        case elevation
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
    }
}