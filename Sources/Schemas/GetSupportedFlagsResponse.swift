import Foundation

/// Countries and organizations that have flags available.
public struct GetSupportedFlagsResponse: Codable, Hashable, Sendable {
    /// Countries with a flag, each with its name and ISO 3166-1 alpha-2/alpha-3 codes.
    public let supportedCountries: [GetSupportedFlagsResponseSupportedCountriesItem]
    /// Identifiers of supported organizations, usable as the flag lookup key.
    public let supportedOrganizations: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        supportedCountries: [GetSupportedFlagsResponseSupportedCountriesItem],
        supportedOrganizations: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.supportedCountries = supportedCountries
        self.supportedOrganizations = supportedOrganizations
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.supportedCountries = try container.decode([GetSupportedFlagsResponseSupportedCountriesItem].self, forKey: .supportedCountries)
        self.supportedOrganizations = try container.decode([String].self, forKey: .supportedOrganizations)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.supportedCountries, forKey: .supportedCountries)
        try container.encode(self.supportedOrganizations, forKey: .supportedOrganizations)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case supportedCountries = "supported_countries"
        case supportedOrganizations = "supported_organizations"
    }
}