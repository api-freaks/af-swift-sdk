import Foundation

/// A single country supported by the SWIFT/BIC Code Lookup and Finder APIs.
public struct VatSupportedCountriesResponseSwiftSupportedCountriesItem: Codable, Hashable, Sendable {
    /// Full country name.
    public let name: String
    /// ISO 3166-1 alpha-2 country code.
    public let countryCode: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        countryCode: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.countryCode = countryCode
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.countryCode = try container.decode(String.self, forKey: .countryCode)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.countryCode, forKey: .countryCode)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case countryCode
    }
}