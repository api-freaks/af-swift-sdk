import Foundation

/// Full domain reputation assessment response.
public struct DomainReputationResponse: Codable, Hashable, Sendable {
    /// Input object containing the analyzed domain.
    public let input: DomainReputationResponseInput
    /// Timestamp when the assessment was performed (YYYY-MM-DDTHH:mm:ssZ).
    public let assessedAt: String
    /// API / response schema version.
    public let version: String
    /// Time taken to process the request, in milliseconds.
    public let processingTimeMs: Int
    /// Overall risk assessment for the domain.
    public let riskCategory: DomainReputationResponseRiskCategory
    /// Domain Generation Algorithm (DGA) detection results.
    public let dgaScore: DomainReputationResponseDgaScore
    /// Trust scoring and supporting signals for the domain.
    public let trustSignals: DomainReputationResponseTrustSignals
    /// Assessment of the domain's ability to send and receive email reliably.
    public let emailDeliverability: DomainReputationResponseEmailDeliverability
    /// Threat intelligence details for the indicator of compromise (IOC).
    public let intelligence: DomainReputationResponseIntelligence
    /// Summary of reasons behind the risk assessment.
    public let evidenceSummary: DomainReputationResponseEvidenceSummary
    /// List of errors encountered during processing, if any (e.g. "WHOIS lookup failed"). An empty array means every signal resolved.
    public let errors: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        input: DomainReputationResponseInput,
        assessedAt: String,
        version: String,
        processingTimeMs: Int,
        riskCategory: DomainReputationResponseRiskCategory,
        dgaScore: DomainReputationResponseDgaScore,
        trustSignals: DomainReputationResponseTrustSignals,
        emailDeliverability: DomainReputationResponseEmailDeliverability,
        intelligence: DomainReputationResponseIntelligence,
        evidenceSummary: DomainReputationResponseEvidenceSummary,
        errors: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.input = input
        self.assessedAt = assessedAt
        self.version = version
        self.processingTimeMs = processingTimeMs
        self.riskCategory = riskCategory
        self.dgaScore = dgaScore
        self.trustSignals = trustSignals
        self.emailDeliverability = emailDeliverability
        self.intelligence = intelligence
        self.evidenceSummary = evidenceSummary
        self.errors = errors
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.input = try container.decode(DomainReputationResponseInput.self, forKey: .input)
        self.assessedAt = try container.decode(String.self, forKey: .assessedAt)
        self.version = try container.decode(String.self, forKey: .version)
        self.processingTimeMs = try container.decode(Int.self, forKey: .processingTimeMs)
        self.riskCategory = try container.decode(DomainReputationResponseRiskCategory.self, forKey: .riskCategory)
        self.dgaScore = try container.decode(DomainReputationResponseDgaScore.self, forKey: .dgaScore)
        self.trustSignals = try container.decode(DomainReputationResponseTrustSignals.self, forKey: .trustSignals)
        self.emailDeliverability = try container.decode(DomainReputationResponseEmailDeliverability.self, forKey: .emailDeliverability)
        self.intelligence = try container.decode(DomainReputationResponseIntelligence.self, forKey: .intelligence)
        self.evidenceSummary = try container.decode(DomainReputationResponseEvidenceSummary.self, forKey: .evidenceSummary)
        self.errors = try container.decode([String].self, forKey: .errors)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.input, forKey: .input)
        try container.encode(self.assessedAt, forKey: .assessedAt)
        try container.encode(self.version, forKey: .version)
        try container.encode(self.processingTimeMs, forKey: .processingTimeMs)
        try container.encode(self.riskCategory, forKey: .riskCategory)
        try container.encode(self.dgaScore, forKey: .dgaScore)
        try container.encode(self.trustSignals, forKey: .trustSignals)
        try container.encode(self.emailDeliverability, forKey: .emailDeliverability)
        try container.encode(self.intelligence, forKey: .intelligence)
        try container.encode(self.evidenceSummary, forKey: .evidenceSummary)
        try container.encode(self.errors, forKey: .errors)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case input
        case assessedAt = "assessed_at"
        case version
        case processingTimeMs = "processing_time_ms"
        case riskCategory = "risk_category"
        case dgaScore = "dga_score"
        case trustSignals = "trust_signals"
        case emailDeliverability = "email_deliverability"
        case intelligence
        case evidenceSummary = "evidence_summary"
        case errors
    }
}