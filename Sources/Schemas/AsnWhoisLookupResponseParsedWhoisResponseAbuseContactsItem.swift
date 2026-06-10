import Foundation

public struct AsnWhoisLookupResponseParsedWhoisResponseAbuseContactsItem: Codable, Hashable, Sendable {
    public let handle: String
    public let name: String
    public let email: [String]
    public let phone: [String]?
    public let source: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        handle: String,
        name: String,
        email: [String],
        phone: [String]? = nil,
        source: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.handle = handle
        self.name = name
        self.email = email
        self.phone = phone
        self.source = source
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.handle = try container.decode(String.self, forKey: .handle)
        self.name = try container.decode(String.self, forKey: .name)
        self.email = try container.decode([String].self, forKey: .email)
        self.phone = try container.decodeIfPresent([String].self, forKey: .phone)
        self.source = try container.decodeIfPresent(String.self, forKey: .source)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.handle, forKey: .handle)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.email, forKey: .email)
        try container.encodeIfPresent(self.phone, forKey: .phone)
        try container.encodeIfPresent(self.source, forKey: .source)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case handle
        case name
        case email
        case phone
        case source
    }
}