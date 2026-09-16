import Foundation

/// Threat intelligence details for the indicator of compromise (IOC).
public struct DomainReputationResponseIntelligence: Codable, Hashable, Sendable {
    /// Type of the indicator of compromise (e.g. domain).
    public let iocType: String
    /// Value of the indicator of compromise.
    public let iocValue: String
    /// Other IOCs related to this domain.
    public let relatedIocs: [DomainReputationResponseIntelligenceRelatedIocsItem]
    /// Tags associated with this IOC from threat feeds.
    public let feedTags: [String]
    /// STIX 2.1 pattern representation of the IOC, ready to wrap into an Indicator object.
    public let stixPattern: String
    /// Recommended action based on the assessment.
    public let recommendedAction: DomainReputationResponseIntelligenceRecommendedAction
    /// First time this IOC was observed (YYYY-MM-DDTHH:mm:ssZ). null when never observed on a feed.
    public let firstSeen: Nullable<String>
    /// Last time this IOC was observed (YYYY-MM-DDTHH:mm:ssZ). null when never observed on a feed.
    public let lastSeen: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        iocType: String,
        iocValue: String,
        relatedIocs: [DomainReputationResponseIntelligenceRelatedIocsItem],
        feedTags: [String],
        stixPattern: String,
        recommendedAction: DomainReputationResponseIntelligenceRecommendedAction,
        firstSeen: Nullable<String>,
        lastSeen: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.iocType = iocType
        self.iocValue = iocValue
        self.relatedIocs = relatedIocs
        self.feedTags = feedTags
        self.stixPattern = stixPattern
        self.recommendedAction = recommendedAction
        self.firstSeen = firstSeen
        self.lastSeen = lastSeen
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.iocType = try container.decode(String.self, forKey: .iocType)
        self.iocValue = try container.decode(String.self, forKey: .iocValue)
        self.relatedIocs = try container.decode([DomainReputationResponseIntelligenceRelatedIocsItem].self, forKey: .relatedIocs)
        self.feedTags = try container.decode([String].self, forKey: .feedTags)
        self.stixPattern = try container.decode(String.self, forKey: .stixPattern)
        self.recommendedAction = try container.decode(DomainReputationResponseIntelligenceRecommendedAction.self, forKey: .recommendedAction)
        self.firstSeen = try container.decode(Nullable<String>.self, forKey: .firstSeen)
        self.lastSeen = try container.decode(Nullable<String>.self, forKey: .lastSeen)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.iocType, forKey: .iocType)
        try container.encode(self.iocValue, forKey: .iocValue)
        try container.encode(self.relatedIocs, forKey: .relatedIocs)
        try container.encode(self.feedTags, forKey: .feedTags)
        try container.encode(self.stixPattern, forKey: .stixPattern)
        try container.encode(self.recommendedAction, forKey: .recommendedAction)
        try container.encode(self.firstSeen, forKey: .firstSeen)
        try container.encode(self.lastSeen, forKey: .lastSeen)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case iocType = "ioc_type"
        case iocValue = "ioc_value"
        case relatedIocs = "related_iocs"
        case feedTags = "feed_tags"
        case stixPattern = "stix_pattern"
        case recommendedAction = "recommended_action"
        case firstSeen = "first_seen"
        case lastSeen = "last_seen"
    }
}