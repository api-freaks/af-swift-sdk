import Foundation

/// Country-specific metadata.
public struct GeolocationLookupV2ResponseCountryMetadata: Codable, Hashable, Sendable {
    /// Calling code/Dialing code of the country.
    public let callingCode: String
    /// Top Level Domain Name (TLD) of the country, which is also called ccTLD.
    public let tld: String
    /// List of the languages' codes, spoken in the country.
    public let languages: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        callingCode: String,
        tld: String,
        languages: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.callingCode = callingCode
        self.tld = tld
        self.languages = languages
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.callingCode = try container.decode(String.self, forKey: .callingCode)
        self.tld = try container.decode(String.self, forKey: .tld)
        self.languages = try container.decode([String].self, forKey: .languages)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.callingCode, forKey: .callingCode)
        try container.encode(self.tld, forKey: .tld)
        try container.encode(self.languages, forKey: .languages)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case callingCode = "calling_code"
        case tld
        case languages
    }
}