import Foundation

/// Astronomy data response containing location information and astronomical data.
public struct AstronomyLookupV2Response: Codable, Hashable, Sendable {
    /// IPv4 or IPv6 address used for the geo-IP lookup. Present when the ip parameter is passed explicitly, or when no location, lat/long, or ip parameter is supplied at all (the API falls back to the requesting client's IP address). Absent when location or lat/long is used.
    public let ip: String?
    /// Geographic location information for the astronomy calculation. The set of populated fields depends on which lookup mode the request used: (1) location param (geocode-by-address) returns location_string plus a basic field set (country_name, state_prov, city, locality, latitude, longitude, elevation); (2) lat + long params (geocode-by-coordinates) returns the same basic field set minus location_string, and locality may be an empty string when the coordinates don't resolve to a named sub-area; (3) ip param, or no location/lat/long/ip param at all (falls back to geo-IP lookup of the client's IP), returns the full geo-IP field set — continent_code, continent_name, country_code2, country_code3, country_name_official, is_eu, state_code, district, zipcode — in addition to the basic fields, but never location_string. elevation can be an empty string when elevation data is unavailable for the resolved location.
    public let location: AstronomyLookupV2ResponseLocation?
    /// Complete astronomical data for the specified location and date.
    public let astronomy: AstronomyLookupV2ResponseAstronomy
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ip: String? = nil,
        location: AstronomyLookupV2ResponseLocation? = nil,
        astronomy: AstronomyLookupV2ResponseAstronomy,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.ip = ip
        self.location = location
        self.astronomy = astronomy
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ip = try container.decodeIfPresent(String.self, forKey: .ip)
        self.location = try container.decodeIfPresent(AstronomyLookupV2ResponseLocation.self, forKey: .location)
        self.astronomy = try container.decode(AstronomyLookupV2ResponseAstronomy.self, forKey: .astronomy)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.ip, forKey: .ip)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encode(self.astronomy, forKey: .astronomy)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ip
        case location
        case astronomy
    }
}