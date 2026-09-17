import Foundation

/// Airport information, present when queried by IATA or ICAO code.
public struct TimezoneLookupV2ResponseAirportDetails: Codable, Hashable, Sendable {
    /// Classification of the airport based on size and traffic.
    public let type: String?
    /// The full name of the airport.
    public let name: String?
    /// The latitude coordinate of the airport.
    public let latitude: String?
    /// The longitude coordinate of the airport.
    public let longitude: String?
    /// The elevation of the airport above sea level, measured in feet.
    public let elevationFt: Int?
    /// The two-letter code of the continent.
    public let continentCode: String?
    /// The ISO 3166-1 alpha-2 code for the country where the airport is located.
    public let countryCode: String?
    /// Code of the state/province/region where the airport is located.
    public let stateCode: String?
    /// The city or administrative region that the airport serves.
    public let city: String?
    /// The three-letter IATA airport code (e.g., LHR).
    public let iataCode: String?
    /// The four-letter ICAO airport code (e.g., EGLL).
    public let icaoCode: String?
    /// The FAA location identifier, used primarily in the United States.
    public let faaCode: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: String? = nil,
        name: String? = nil,
        latitude: String? = nil,
        longitude: String? = nil,
        elevationFt: Int? = nil,
        continentCode: String? = nil,
        countryCode: String? = nil,
        stateCode: String? = nil,
        city: String? = nil,
        iataCode: String? = nil,
        icaoCode: String? = nil,
        faaCode: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.elevationFt = elevationFt
        self.continentCode = continentCode
        self.countryCode = countryCode
        self.stateCode = stateCode
        self.city = city
        self.iataCode = iataCode
        self.icaoCode = icaoCode
        self.faaCode = faaCode
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.latitude = try container.decodeIfPresent(String.self, forKey: .latitude)
        self.longitude = try container.decodeIfPresent(String.self, forKey: .longitude)
        self.elevationFt = try container.decodeIfPresent(Int.self, forKey: .elevationFt)
        self.continentCode = try container.decodeIfPresent(String.self, forKey: .continentCode)
        self.countryCode = try container.decodeIfPresent(String.self, forKey: .countryCode)
        self.stateCode = try container.decodeIfPresent(String.self, forKey: .stateCode)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.iataCode = try container.decodeIfPresent(String.self, forKey: .iataCode)
        self.icaoCode = try container.decodeIfPresent(String.self, forKey: .icaoCode)
        self.faaCode = try container.decodeIfPresent(String.self, forKey: .faaCode)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.latitude, forKey: .latitude)
        try container.encodeIfPresent(self.longitude, forKey: .longitude)
        try container.encodeIfPresent(self.elevationFt, forKey: .elevationFt)
        try container.encodeIfPresent(self.continentCode, forKey: .continentCode)
        try container.encodeIfPresent(self.countryCode, forKey: .countryCode)
        try container.encodeIfPresent(self.stateCode, forKey: .stateCode)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.iataCode, forKey: .iataCode)
        try container.encodeIfPresent(self.icaoCode, forKey: .icaoCode)
        try container.encodeIfPresent(self.faaCode, forKey: .faaCode)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case name
        case latitude
        case longitude
        case elevationFt = "elevation_ft"
        case continentCode = "continent_code"
        case countryCode = "country_code"
        case stateCode = "state_code"
        case city
        case iataCode = "iata_code"
        case icaoCode = "icao_code"
        case faaCode = "faa_code"
    }
}