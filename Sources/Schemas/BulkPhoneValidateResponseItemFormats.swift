import Foundation

/// The number represented in four standardized formats. Only returned for valid numbers.
public struct BulkPhoneValidateResponseItemFormats: Codable, Hashable, Sendable {
    /// E.164 format for storage and APIs.
    public let e164: String?
    /// Human-readable international format.
    public let international: String?
    /// Local format as dialed within the country.
    public let national: String?
    /// URI format for tel: links.
    public let rfc3966: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        e164: String? = nil,
        international: String? = nil,
        national: String? = nil,
        rfc3966: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.e164 = e164
        self.international = international
        self.national = national
        self.rfc3966 = rfc3966
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.e164 = try container.decodeIfPresent(String.self, forKey: .e164)
        self.international = try container.decodeIfPresent(String.self, forKey: .international)
        self.national = try container.decodeIfPresent(String.self, forKey: .national)
        self.rfc3966 = try container.decodeIfPresent(String.self, forKey: .rfc3966)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.e164, forKey: .e164)
        try container.encodeIfPresent(self.international, forKey: .international)
        try container.encodeIfPresent(self.national, forKey: .national)
        try container.encodeIfPresent(self.rfc3966, forKey: .rfc3966)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case e164 = "E164"
        case international = "International"
        case national = "National"
        case rfc3966 = "RFC3966"
    }
}