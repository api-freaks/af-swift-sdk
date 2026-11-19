import Foundation

/// Domain-level disposable/spam/free classification for the email address.
public struct BulkDisposableEmailCheckV2ResponseDisposableEmailResponseItemDomain: Codable, Hashable, Sendable {
    /// Extracted domain component from the email address.
    public let name: String
    /// Domain validation status confirming DNS resolution capability.
    public let validDomain: Bool
    /// Classification flag identifying domains from temporary/throwaway email service providers. Omitted when validSyntax is false or the domain could not be resolved.
    public let disposable: Bool?
    /// Classification indicating free or consumer-grade email service providers. Omitted when validSyntax is false or the domain could not be resolved.
    public let free: Bool?
    /// Reputation indicator flagging domains on spam databases. Omitted when validSyntax is false or the domain could not be resolved.
    public let spam: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        validDomain: Bool,
        disposable: Bool? = nil,
        free: Bool? = nil,
        spam: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.validDomain = validDomain
        self.disposable = disposable
        self.free = free
        self.spam = spam
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.validDomain = try container.decode(Bool.self, forKey: .validDomain)
        self.disposable = try container.decodeIfPresent(Bool.self, forKey: .disposable)
        self.free = try container.decodeIfPresent(Bool.self, forKey: .free)
        self.spam = try container.decodeIfPresent(Bool.self, forKey: .spam)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.validDomain, forKey: .validDomain)
        try container.encodeIfPresent(self.disposable, forKey: .disposable)
        try container.encodeIfPresent(self.free, forKey: .free)
        try container.encodeIfPresent(self.spam, forKey: .spam)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case validDomain
        case disposable
        case free
        case spam
    }
}