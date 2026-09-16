import Foundation

/// Signals contributing to the trust score.
public struct DomainReputationResponseTrustSignalsSignals: Codable, Hashable, Sendable {
    /// Signals that positively affect the trust score.
    public let positive: [DomainReputationResponseTrustSignalsSignalsPositiveItem]
    /// Signals that negatively affect the trust score.
    public let negative: [DomainReputationResponseTrustSignalsSignalsNegativeItem]
    /// Signals that are neutral to the trust score.
    public let neutral: [DomainReputationResponseTrustSignalsSignalsNeutralItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        positive: [DomainReputationResponseTrustSignalsSignalsPositiveItem],
        negative: [DomainReputationResponseTrustSignalsSignalsNegativeItem],
        neutral: [DomainReputationResponseTrustSignalsSignalsNeutralItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.positive = positive
        self.negative = negative
        self.neutral = neutral
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.positive = try container.decode([DomainReputationResponseTrustSignalsSignalsPositiveItem].self, forKey: .positive)
        self.negative = try container.decode([DomainReputationResponseTrustSignalsSignalsNegativeItem].self, forKey: .negative)
        self.neutral = try container.decode([DomainReputationResponseTrustSignalsSignalsNeutralItem].self, forKey: .neutral)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.positive, forKey: .positive)
        try container.encode(self.negative, forKey: .negative)
        try container.encode(self.neutral, forKey: .neutral)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case positive
        case negative
        case neutral
    }
}