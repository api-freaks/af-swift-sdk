import Foundation

public struct TimezoneLookupResponse: Codable, Hashable, Sendable {
    public let ip: String?
    public let location: TimezoneLookupResponseLocation?
    public let timeZone: TimezoneLookupResponseTimeZone
    public let airportDetails: TimezoneLookupResponseAirportDetails?
    public let loCodeDetails: TimezoneLookupResponseLoCodeDetails?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ip: String? = nil,
        location: TimezoneLookupResponseLocation? = nil,
        timeZone: TimezoneLookupResponseTimeZone,
        airportDetails: TimezoneLookupResponseAirportDetails? = nil,
        loCodeDetails: TimezoneLookupResponseLoCodeDetails? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.ip = ip
        self.location = location
        self.timeZone = timeZone
        self.airportDetails = airportDetails
        self.loCodeDetails = loCodeDetails
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ip = try container.decodeIfPresent(String.self, forKey: .ip)
        self.location = try container.decodeIfPresent(TimezoneLookupResponseLocation.self, forKey: .location)
        self.timeZone = try container.decode(TimezoneLookupResponseTimeZone.self, forKey: .timeZone)
        self.airportDetails = try container.decodeIfPresent(TimezoneLookupResponseAirportDetails.self, forKey: .airportDetails)
        self.loCodeDetails = try container.decodeIfPresent(TimezoneLookupResponseLoCodeDetails.self, forKey: .loCodeDetails)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.ip, forKey: .ip)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encode(self.timeZone, forKey: .timeZone)
        try container.encodeIfPresent(self.airportDetails, forKey: .airportDetails)
        try container.encodeIfPresent(self.loCodeDetails, forKey: .loCodeDetails)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ip
        case location
        case timeZone = "time_zone"
        case airportDetails = "airport_details"
        case loCodeDetails = "lo_code_details"
    }
}