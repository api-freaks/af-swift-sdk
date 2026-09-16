import Foundation

public struct TimezoneLookupResponseAirportDetails: Codable, Hashable, Sendable {
    public let type: String
    public let name: String
    public let longitude: String
    public let latitude: String
    public let elevationFt: Double
    public let continentCode: String
    public let countryCode: String
    public let stateCode: String
    public let city: String
    public let iataCode: String
    public let icaoCode: String
    public let faaCode: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: String,
        name: String,
        longitude: String,
        latitude: String,
        elevationFt: Double,
        continentCode: String,
        countryCode: String,
        stateCode: String,
        city: String,
        iataCode: String,
        icaoCode: String,
        faaCode: String,
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
        self.type = try container.decode(String.self, forKey: .type)
        self.name = try container.decode(String.self, forKey: .name)
        self.longitude = try container.decode(String.self, forKey: .longitude)
        self.latitude = try container.decode(String.self, forKey: .latitude)
        self.elevationFt = try container.decode(Double.self, forKey: .elevationFt)
        self.continentCode = try container.decode(String.self, forKey: .continentCode)
        self.countryCode = try container.decode(String.self, forKey: .countryCode)
        self.stateCode = try container.decode(String.self, forKey: .stateCode)
        self.city = try container.decode(String.self, forKey: .city)
        self.iataCode = try container.decode(String.self, forKey: .iataCode)
        self.icaoCode = try container.decode(String.self, forKey: .icaoCode)
        self.faaCode = try container.decode(String.self, forKey: .faaCode)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.longitude, forKey: .longitude)
        try container.encode(self.latitude, forKey: .latitude)
        try container.encode(self.elevationFt, forKey: .elevationFt)
        try container.encode(self.continentCode, forKey: .continentCode)
        try container.encode(self.countryCode, forKey: .countryCode)
        try container.encode(self.stateCode, forKey: .stateCode)
        try container.encode(self.city, forKey: .city)
        try container.encode(self.iataCode, forKey: .iataCode)
        try container.encode(self.icaoCode, forKey: .icaoCode)
        try container.encode(self.faaCode, forKey: .faaCode)
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