import Foundation

/// Polarity of the signal.
public enum DomainReputationResponseTrustSignalsSignalsNeutralItemPolarity: String, Codable, Hashable, CaseIterable, Sendable {
    case positive
    case negative
    case neutral
}