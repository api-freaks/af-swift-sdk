import Foundation

/// Recommended action based on the assessment.
public enum DomainReputationResponseIntelligenceRecommendedAction: String, Codable, Hashable, CaseIterable, Sendable {
    case allow
    case monitor
    case block
}