import Foundation

public struct GetSupportedFlagsResponseItem: Codable, Hashable, Sendable {
    public let name: String
    public let iso2: String
    public let iso3: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        iso2: String,
        iso3: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.iso2 = iso2
        self.iso3 = iso3
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.iso2 = try container.decode(String.self, forKey: .iso2)
        self.iso3 = try container.decode(String.self, forKey: .iso3)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.iso2, forKey: .iso2)
        try container.encode(self.iso3, forKey: .iso3)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case iso2
        case iso3
    }
}