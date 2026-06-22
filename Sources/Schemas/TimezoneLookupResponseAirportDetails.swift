import Foundation

public struct TimezoneLookupResponseAirportDetails: Codable, Hashable, Sendable {
    public let type: String?
    public let name: String?
    public let longitude: Double?
    public let latitude: Double?
    public let elevationFt: Double?
    public let continentCode: String?
    public let countryCode: String?
    public let stateCode: String?
    public let city: String?
    public let iataCode: String?
    public let icaoCode: String?
    public let faaCode: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: String? = nil,
        name: String? = nil,
        longitude: Double? = nil,
        latitude: Double? = nil,
        elevationFt: Double? = nil,
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
        self.longitude = longitude
        self.latitude = latitude
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
        self.longitude = try container.decodeIfPresent(Double.self, forKey: .longitude)
        self.latitude = try container.decodeIfPresent(Double.self, forKey: .latitude)
        self.elevationFt = try container.decodeIfPresent(Double.self, forKey: .elevationFt)
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
        try container.encodeIfPresent(self.longitude, forKey: .longitude)
        try container.encodeIfPresent(self.latitude, forKey: .latitude)
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
        case longitude
        case latitude
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