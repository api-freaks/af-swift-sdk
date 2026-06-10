import Foundation

public struct BulkEmailValidateRequestEmailDataItem: Codable, Hashable, Sendable {
    /// Email address to validate
    public let email: String
    /// Name associated with the email address
    public let name: String?
    /// IP address associated with the email address
    public let ip: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        email: String,
        name: String? = nil,
        ip: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.email = email
        self.name = name
        self.ip = ip
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decode(String.self, forKey: .email)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.ip = try container.decodeIfPresent(String.self, forKey: .ip)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.email, forKey: .email)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.ip, forKey: .ip)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case email
        case name
        case ip
    }
}