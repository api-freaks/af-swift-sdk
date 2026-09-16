import Foundation

/// Trust scoring and supporting signals for the domain.
public struct DomainReputationResponseTrustSignals: Codable, Hashable, Sendable {
    /// Overall trust score (0-100).
    public let trustScore: Int
    /// Trust score band / category (e.g. low, medium, high).
    public let trustBand: String
    /// Signals contributing to the trust score.
    public let signals: DomainReputationResponseTrustSignalsSignals
    /// Individual trust / risk indicators for the domain.
    public let indicators: DomainReputationResponseTrustSignalsIndicators
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        trustScore: Int,
        trustBand: String,
        signals: DomainReputationResponseTrustSignalsSignals,
        indicators: DomainReputationResponseTrustSignalsIndicators,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.trustScore = trustScore
        self.trustBand = trustBand
        self.signals = signals
        self.indicators = indicators
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.trustScore = try container.decode(Int.self, forKey: .trustScore)
        self.trustBand = try container.decode(String.self, forKey: .trustBand)
        self.signals = try container.decode(DomainReputationResponseTrustSignalsSignals.self, forKey: .signals)
        self.indicators = try container.decode(DomainReputationResponseTrustSignalsIndicators.self, forKey: .indicators)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.trustScore, forKey: .trustScore)
        try container.encode(self.trustBand, forKey: .trustBand)
        try container.encode(self.signals, forKey: .signals)
        try container.encode(self.indicators, forKey: .indicators)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case trustScore = "trust_score"
        case trustBand = "trust_band"
        case signals
        case indicators
    }
}