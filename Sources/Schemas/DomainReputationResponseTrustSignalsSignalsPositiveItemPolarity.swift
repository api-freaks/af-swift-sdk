import Foundation

/// Polarity of the signal.
public enum DomainReputationResponseTrustSignalsSignalsPositiveItemPolarity: String, Codable, Hashable, CaseIterable, Sendable {
    case positive
    case negative
    case neutral
}