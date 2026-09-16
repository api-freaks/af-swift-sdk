import Foundation

public struct DomainTyposquattingResponseDomainsItem: Codable, Hashable, Sendable {
    public let domainName: String
    /// Domain creation date (YYYY-MM-DD). May be absent for older or less-actively-tracked entries.
    public let createDate: String?
    /// Domain expiration date (YYYY-MM-DD). May be absent for older or less-actively-tracked entries.
    public let expiryDate: String?
    /// Last time the domain was observed (YYYY-MM-DD).
    public let lastSeen: String?
    /// Indicates whether the domain has dropped out of the registry and become available to register again.
    public let isDropped: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        domainName: String,
        createDate: String? = nil,
        expiryDate: String? = nil,
        lastSeen: String? = nil,
        isDropped: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.domainName = domainName
        self.createDate = createDate
        self.expiryDate = expiryDate
        self.lastSeen = lastSeen
        self.isDropped = isDropped
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.domainName = try container.decode(String.self, forKey: .domainName)
        self.createDate = try container.decodeIfPresent(String.self, forKey: .createDate)
        self.expiryDate = try container.decodeIfPresent(String.self, forKey: .expiryDate)
        self.lastSeen = try container.decodeIfPresent(String.self, forKey: .lastSeen)
        self.isDropped = try container.decode(Bool.self, forKey: .isDropped)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.domainName, forKey: .domainName)
        try container.encodeIfPresent(self.createDate, forKey: .createDate)
        try container.encodeIfPresent(self.expiryDate, forKey: .expiryDate)
        try container.encodeIfPresent(self.lastSeen, forKey: .lastSeen)
        try container.encode(self.isDropped, forKey: .isDropped)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case domainName
        case createDate
        case expiryDate
        case lastSeen
        case isDropped
    }
}