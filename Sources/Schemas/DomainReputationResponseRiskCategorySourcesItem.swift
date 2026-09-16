import Foundation

/// A threat intelligence source that flagged the domain.
public struct DomainReputationResponseRiskCategorySourcesItem: Codable, Hashable, Sendable {
    /// Name of the threat intelligence source (e.g. Spamhaus).
    public let source: String
    /// Indicator matched by this source.
    public let indicator: String
    /// Threat type reported by this source.
    public let threatType: String
    /// Confidence score from this source (0-1).
    public let confidence: Float
    /// First time this indicator was seen by the source (YYYY-MM-DDTHH:mm:ssZ).
    public let firstSeen: String
    /// Last time this indicator was seen by the source (YYYY-MM-DDTHH:mm:ssZ).
    public let lastSeen: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        source: String,
        indicator: String,
        threatType: String,
        confidence: Float,
        firstSeen: String,
        lastSeen: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.source = source
        self.indicator = indicator
        self.threatType = threatType
        self.confidence = confidence
        self.firstSeen = firstSeen
        self.lastSeen = lastSeen
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.source = try container.decode(String.self, forKey: .source)
        self.indicator = try container.decode(String.self, forKey: .indicator)
        self.threatType = try container.decode(String.self, forKey: .threatType)
        self.confidence = try container.decode(Float.self, forKey: .confidence)
        self.firstSeen = try container.decode(String.self, forKey: .firstSeen)
        self.lastSeen = try container.decode(String.self, forKey: .lastSeen)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.source, forKey: .source)
        try container.encode(self.indicator, forKey: .indicator)
        try container.encode(self.threatType, forKey: .threatType)
        try container.encode(self.confidence, forKey: .confidence)
        try container.encode(self.firstSeen, forKey: .firstSeen)
        try container.encode(self.lastSeen, forKey: .lastSeen)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case source
        case indicator
        case threatType = "threat_type"
        case confidence
        case firstSeen = "first_seen"
        case lastSeen = "last_seen"
    }
}