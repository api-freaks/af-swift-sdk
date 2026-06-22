import Foundation

public struct SubdomainsLookupResponseSubdomainsItem: Codable, Hashable, Sendable {
    public let subdomain: String
    public let firstSeen: String
    public let lastSeen: String
    /// The date from which the subdomain is considered inactive. Appears only if the subdomain is no longer active.
    public let inactiveFrom: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        subdomain: String,
        firstSeen: String,
        lastSeen: String,
        inactiveFrom: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.subdomain = subdomain
        self.firstSeen = firstSeen
        self.lastSeen = lastSeen
        self.inactiveFrom = inactiveFrom
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.subdomain = try container.decode(String.self, forKey: .subdomain)
        self.firstSeen = try container.decode(String.self, forKey: .firstSeen)
        self.lastSeen = try container.decode(String.self, forKey: .lastSeen)
        self.inactiveFrom = try container.decodeIfPresent(String.self, forKey: .inactiveFrom)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.subdomain, forKey: .subdomain)
        try container.encode(self.firstSeen, forKey: .firstSeen)
        try container.encode(self.lastSeen, forKey: .lastSeen)
        try container.encodeIfPresent(self.inactiveFrom, forKey: .inactiveFrom)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case subdomain
        case firstSeen = "first_seen"
        case lastSeen = "last_seen"
        case inactiveFrom = "inactive_from"
    }
}