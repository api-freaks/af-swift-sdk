import Foundation

/// Overall risk assessment for the domain.
public struct DomainReputationResponseRiskCategory: Codable, Hashable, Sendable {
    /// Final verdict of the risk assessment.
    public let verdict: DomainReputationResponseRiskCategoryVerdict
    /// Confidence score for the verdict (0-1).
    public let confidence: Float
    /// Main threat type identified (e.g. phishing). null when no threat was identified.
    public let primaryThreat: Nullable<String>
    /// Severity level of the risk.
    public let severity: DomainReputationResponseRiskCategorySeverity
    /// List of threat types associated with the domain.
    public let threatTypes: [String]
    /// Threat intelligence sources that flagged the domain. Empty when nothing flagged it.
    public let sources: [DomainReputationResponseRiskCategorySourcesItem]
    /// Related pivots (nameserver, email, etc.) linked to known threats.
    public let pivotMatches: [DomainReputationResponseRiskCategoryPivotMatchesItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        verdict: DomainReputationResponseRiskCategoryVerdict,
        confidence: Float,
        primaryThreat: Nullable<String>,
        severity: DomainReputationResponseRiskCategorySeverity,
        threatTypes: [String],
        sources: [DomainReputationResponseRiskCategorySourcesItem],
        pivotMatches: [DomainReputationResponseRiskCategoryPivotMatchesItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.verdict = verdict
        self.confidence = confidence
        self.primaryThreat = primaryThreat
        self.severity = severity
        self.threatTypes = threatTypes
        self.sources = sources
        self.pivotMatches = pivotMatches
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.verdict = try container.decode(DomainReputationResponseRiskCategoryVerdict.self, forKey: .verdict)
        self.confidence = try container.decode(Float.self, forKey: .confidence)
        self.primaryThreat = try container.decode(Nullable<String>.self, forKey: .primaryThreat)
        self.severity = try container.decode(DomainReputationResponseRiskCategorySeverity.self, forKey: .severity)
        self.threatTypes = try container.decode([String].self, forKey: .threatTypes)
        self.sources = try container.decode([DomainReputationResponseRiskCategorySourcesItem].self, forKey: .sources)
        self.pivotMatches = try container.decode([DomainReputationResponseRiskCategoryPivotMatchesItem].self, forKey: .pivotMatches)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.verdict, forKey: .verdict)
        try container.encode(self.confidence, forKey: .confidence)
        try container.encode(self.primaryThreat, forKey: .primaryThreat)
        try container.encode(self.severity, forKey: .severity)
        try container.encode(self.threatTypes, forKey: .threatTypes)
        try container.encode(self.sources, forKey: .sources)
        try container.encode(self.pivotMatches, forKey: .pivotMatches)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case verdict
        case confidence
        case primaryThreat = "primary_threat"
        case severity
        case threatTypes = "threat_types"
        case sources
        case pivotMatches = "pivot_matches"
    }
}