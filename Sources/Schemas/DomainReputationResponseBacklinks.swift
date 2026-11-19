import Foundation

/// Backlink profile of the domain.
public struct DomainReputationResponseBacklinks: Codable, Hashable, Sendable {
    /// true if backlink data exists for the domain. When false, the other fields are null.
    public let found: Bool
    /// Domain the backlink data was matched to (for example `google.com`). null when no data was found.
    public let matchedDomain: Nullable<String>?
    /// Total number of backlinks pointing to the domain (for example 174614443). null when no data was found.
    public let backlinkCount: Nullable<Int>?
    /// Number of distinct domains linking to the domain (for example 4336653). null when no data was found.
    public let referringDomains: Nullable<Int>?
    /// Average number of backlinks per referring domain (backlink_count / referring_domains, for example 40.26). null when no data was found.
    public let referrerLinkDensity: Nullable<Double>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        found: Bool,
        matchedDomain: Nullable<String>? = nil,
        backlinkCount: Nullable<Int>? = nil,
        referringDomains: Nullable<Int>? = nil,
        referrerLinkDensity: Nullable<Double>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.found = found
        self.matchedDomain = matchedDomain
        self.backlinkCount = backlinkCount
        self.referringDomains = referringDomains
        self.referrerLinkDensity = referrerLinkDensity
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.found = try container.decode(Bool.self, forKey: .found)
        self.matchedDomain = try container.decodeNullableIfPresent(String.self, forKey: .matchedDomain)
        self.backlinkCount = try container.decodeNullableIfPresent(Int.self, forKey: .backlinkCount)
        self.referringDomains = try container.decodeNullableIfPresent(Int.self, forKey: .referringDomains)
        self.referrerLinkDensity = try container.decodeNullableIfPresent(Double.self, forKey: .referrerLinkDensity)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.found, forKey: .found)
        try container.encodeNullableIfPresent(self.matchedDomain, forKey: .matchedDomain)
        try container.encodeNullableIfPresent(self.backlinkCount, forKey: .backlinkCount)
        try container.encodeNullableIfPresent(self.referringDomains, forKey: .referringDomains)
        try container.encodeNullableIfPresent(self.referrerLinkDensity, forKey: .referrerLinkDensity)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case found
        case matchedDomain = "matched_domain"
        case backlinkCount = "backlink_count"
        case referringDomains = "referring_domains"
        case referrerLinkDensity = "referrer_link_density"
    }
}