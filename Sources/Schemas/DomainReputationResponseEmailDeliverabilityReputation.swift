import Foundation

/// Reputation and trust signals related to the domain's email sending history.
public struct DomainReputationResponseEmailDeliverabilityReputation: Codable, Hashable, Sendable {
    /// Indicates whether the domain appears on known spam blacklists.
    public let spamBlacklisted: Bool
    /// Indicates whether the domain was registered recently.
    public let newlyRegistered: Bool
    /// Age of the domain in days since registration.
    public let domainAgeDays: Nullable<Int>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        spamBlacklisted: Bool,
        newlyRegistered: Bool,
        domainAgeDays: Nullable<Int>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.spamBlacklisted = spamBlacklisted
        self.newlyRegistered = newlyRegistered
        self.domainAgeDays = domainAgeDays
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.spamBlacklisted = try container.decode(Bool.self, forKey: .spamBlacklisted)
        self.newlyRegistered = try container.decode(Bool.self, forKey: .newlyRegistered)
        self.domainAgeDays = try container.decodeNullableIfPresent(Int.self, forKey: .domainAgeDays)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.spamBlacklisted, forKey: .spamBlacklisted)
        try container.encode(self.newlyRegistered, forKey: .newlyRegistered)
        try container.encodeNullableIfPresent(self.domainAgeDays, forKey: .domainAgeDays)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case spamBlacklisted = "spam_blacklisted"
        case newlyRegistered = "newly_registered"
        case domainAgeDays = "domain_age_days"
    }
}