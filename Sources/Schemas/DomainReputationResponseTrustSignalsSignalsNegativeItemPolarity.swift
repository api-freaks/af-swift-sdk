import Foundation

/// Polarity of the signal.
public enum DomainReputationResponseTrustSignalsSignalsNegativeItemPolarity: String, Codable, Hashable, CaseIterable, Sendable {
    case positive
    case negative
    case neutral
}