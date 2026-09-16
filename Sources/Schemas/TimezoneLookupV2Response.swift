import Foundation

/// Timezone lookup result. time_zone is always present. Exactly which other object accompanies it depends on the lookup mode: tz name and lat/long coordinates return time_zone only (no location, no ip); location address returns a basic location object; ip param or client-IP fallback returns a rich location object plus top-level ip; iata_code/icao_code returns airport_details instead of location; lo_code returns lo_code_details instead of location.
public struct TimezoneLookupV2Response: Codable, Hashable, Sendable {
    /// The IP address used for the timezone lookup. Present when queried using the ip parameter, or with no location-identifying parameter at all (client-IP fallback). Absent for every other lookup mode.
    public let ip: String?
    /// Timezone and date/time information for the location.
    public let timeZone: TimezoneLookupV2ResponseTimeZone
    /// Geographic location information. Only present for location (address) and ip (or client-IP fallback) lookups; absent for tz, lat/long, iata_code/icao_code, and lo_code lookups. Field set varies by mode: location returns location_string plus a basic field set (country_name, state_prov, city, locality, latitude, longitude); ip/default returns a richer geo-IP field set (continent_code, continent_name, country_code2, country_code3, country_name_official, is_eu, state_code, district, zipcode) plus the common fields, but never location_string or locality.
    public let location: TimezoneLookupV2ResponseLocation?
    /// Airport information, present when queried by IATA or ICAO code.
    public let airportDetails: TimezoneLookupV2ResponseAirportDetails?
    /// UN/LOCODE location details, present when queried by LO code.
    public let loCodeDetails: TimezoneLookupV2ResponseLoCodeDetails?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ip: String? = nil,
        timeZone: TimezoneLookupV2ResponseTimeZone,
        location: TimezoneLookupV2ResponseLocation? = nil,
        airportDetails: TimezoneLookupV2ResponseAirportDetails? = nil,
        loCodeDetails: TimezoneLookupV2ResponseLoCodeDetails? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.ip = ip
        self.timeZone = timeZone
        self.location = location
        self.airportDetails = airportDetails
        self.loCodeDetails = loCodeDetails
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ip = try container.decodeIfPresent(String.self, forKey: .ip)
        self.timeZone = try container.decode(TimezoneLookupV2ResponseTimeZone.self, forKey: .timeZone)
        self.location = try container.decodeIfPresent(TimezoneLookupV2ResponseLocation.self, forKey: .location)
        self.airportDetails = try container.decodeIfPresent(TimezoneLookupV2ResponseAirportDetails.self, forKey: .airportDetails)
        self.loCodeDetails = try container.decodeIfPresent(TimezoneLookupV2ResponseLoCodeDetails.self, forKey: .loCodeDetails)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.ip, forKey: .ip)
        try container.encode(self.timeZone, forKey: .timeZone)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.airportDetails, forKey: .airportDetails)
        try container.encodeIfPresent(self.loCodeDetails, forKey: .loCodeDetails)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ip
        case timeZone = "time_zone"
        case location
        case airportDetails = "airport_details"
        case loCodeDetails = "lo_code_details"
    }
}