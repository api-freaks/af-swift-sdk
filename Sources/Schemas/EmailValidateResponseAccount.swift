import Foundation

public struct EmailValidateResponseAccount: Codable, Hashable, Sendable {
    public let role: Bool
    public let fullMailBox: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        role: Bool,
        fullMailBox: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.role = role
        self.fullMailBox = fullMailBox
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.role = try container.decode(Bool.self, forKey: .role)
        self.fullMailBox = try container.decodeIfPresent(Bool.self, forKey: .fullMailBox)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.role, forKey: .role)
        try container.encodeIfPresent(self.fullMailBox, forKey: .fullMailBox)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case role
        case fullMailBox
    }
}