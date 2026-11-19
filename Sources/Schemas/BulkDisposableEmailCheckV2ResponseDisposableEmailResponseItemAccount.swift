import Foundation

/// Account-level detection details. Omitted entirely when validSyntax is false.
public struct BulkDisposableEmailCheckV2ResponseDisposableEmailResponseItemAccount: Codable, Hashable, Sendable {
    /// Detection flag identifying role-based email addresses (e.g., admin@, support@).
    public let role: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        role: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.role = role
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.role = try container.decode(Bool.self, forKey: .role)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.role, forKey: .role)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case role
    }
}