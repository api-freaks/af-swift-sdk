import Foundation

/// Final verdict of the risk assessment.
public enum DomainReputationResponseRiskCategoryVerdict: String, Codable, Hashable, CaseIterable, Sendable {
    case safe
    case suspicious
}