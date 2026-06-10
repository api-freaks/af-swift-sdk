import Foundation

public struct AsnWhoisLookupResponseContacts: Codable, Hashable, Sendable {
    public let emailContacts: [String]
    public let abuseContacts: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        emailContacts: [String],
        abuseContacts: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.emailContacts = emailContacts
        self.abuseContacts = abuseContacts
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.emailContacts = try container.decode([String].self, forKey: .emailContacts)
        self.abuseContacts = try container.decode([String].self, forKey: .abuseContacts)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.emailContacts, forKey: .emailContacts)
        try container.encode(self.abuseContacts, forKey: .abuseContacts)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case emailContacts
        case abuseContacts
    }
}