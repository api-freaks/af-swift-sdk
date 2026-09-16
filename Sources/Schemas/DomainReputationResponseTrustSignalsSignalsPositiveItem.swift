import Foundation

/// A single trust signal contributing to the trust score.
public struct DomainReputationResponseTrustSignalsSignalsPositiveItem: Codable, Hashable, Sendable {
    /// Signal code identifier (e.g. valid_ssl, dmarc_missing).
    public let code: String
    /// Weight assigned to the signal.
    public let weight: Int
    /// Polarity of the signal.
    public let polarity: DomainReputationResponseTrustSignalsSignalsPositiveItemPolarity
    /// Category the signal belongs to (e.g. ssl_certificate).
    public let category: String
    /// Evidence supporting the signal.
    public let evidence: String
    /// Confidence score for the signal (0-1).
    public let confidence: Float
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        code: String,
        weight: Int,
        polarity: DomainReputationResponseTrustSignalsSignalsPositiveItemPolarity,
        category: String,
        evidence: String,
        confidence: Float,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.code = code
        self.weight = weight
        self.polarity = polarity
        self.category = category
        self.evidence = evidence
        self.confidence = confidence
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(String.self, forKey: .code)
        self.weight = try container.decode(Int.self, forKey: .weight)
        self.polarity = try container.decode(DomainReputationResponseTrustSignalsSignalsPositiveItemPolarity.self, forKey: .polarity)
        self.category = try container.decode(String.self, forKey: .category)
        self.evidence = try container.decode(String.self, forKey: .evidence)
        self.confidence = try container.decode(Float.self, forKey: .confidence)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.code, forKey: .code)
        try container.encode(self.weight, forKey: .weight)
        try container.encode(self.polarity, forKey: .polarity)
        try container.encode(self.category, forKey: .category)
        try container.encode(self.evidence, forKey: .evidence)
        try container.encode(self.confidence, forKey: .confidence)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case code
        case weight
        case polarity
        case category
        case evidence
        case confidence
    }
}