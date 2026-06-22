import Foundation

public struct AstronomyLookupResponse: Codable, Hashable, Sendable {
    public let ip: String?
    public let location: AstronomyLookupResponseLocation?
    public let astronomy: AstronomyLookupResponseAstronomy
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ip: String? = nil,
        location: AstronomyLookupResponseLocation? = nil,
        astronomy: AstronomyLookupResponseAstronomy,
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
        self.location = try container.decodeIfPresent(AstronomyLookupResponseLocation.self, forKey: .location)
        self.astronomy = try container.decode(AstronomyLookupResponseAstronomy.self, forKey: .astronomy)
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