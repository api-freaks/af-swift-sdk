import Foundation

public struct BulkCurrentWeatherRequestLocationsItem: Codable, Hashable, Sendable {
    /// City name, place name, or full address
    public let location: String?
    /// Latitude
    public let lat: Double?
    /// Longitude
    public let long: Double?
    /// IP address
    public let ip: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        location: String? = nil,
        lat: Double? = nil,
        long: Double? = nil,
        ip: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.location = location
        self.lat = lat
        self.long = long
        self.ip = ip
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.location = try container.decodeIfPresent(String.self, forKey: .location)
        self.lat = try container.decodeIfPresent(Double.self, forKey: .lat)
        self.long = try container.decodeIfPresent(Double.self, forKey: .long)
        self.ip = try container.decodeIfPresent(String.self, forKey: .ip)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.lat, forKey: .lat)
        try container.encodeIfPresent(self.long, forKey: .long)
        try container.encodeIfPresent(self.ip, forKey: .ip)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case location
        case lat
        case long
        case ip
    }
}