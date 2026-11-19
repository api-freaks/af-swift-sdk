import Foundation

/// Final verdict of the risk assessment. `unknown` is returned when there is not enough data (e.g. the domain is not registered).
public enum DomainReputationResponseRiskCategoryVerdict: String, Codable, Hashable, CaseIterable, Sendable {
    case safe
    case suspicious
    case unknown
}