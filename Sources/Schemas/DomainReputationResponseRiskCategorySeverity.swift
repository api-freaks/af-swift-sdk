import Foundation

/// Severity level of the risk.
public enum DomainReputationResponseRiskCategorySeverity: String, Codable, Hashable, CaseIterable, Sendable {
    case none
    case low
    case medium
    case high
}