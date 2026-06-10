import Foundation

public struct GeolocationLookupResponseCountryMetadata: Codable, Hashable, Sendable {
    /// The calling code of the country
    public let callingCode: String?
    /// The top level domain of the country
    public let tld: String?
    /// The languages spoken in the country
    public let languages: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        callingCode: String? = nil,
        tld: String? = nil,
        languages: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.callingCode = callingCode
        self.tld = tld
        self.languages = languages
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.callingCode = try container.decodeIfPresent(String.self, forKey: .callingCode)
        self.tld = try container.decodeIfPresent(String.self, forKey: .tld)
        self.languages = try container.decodeIfPresent([String].self, forKey: .languages)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.callingCode, forKey: .callingCode)
        try container.encodeIfPresent(self.tld, forKey: .tld)
        try container.encodeIfPresent(self.languages, forKey: .languages)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case callingCode = "calling_code"
        case tld
        case languages
    }
}