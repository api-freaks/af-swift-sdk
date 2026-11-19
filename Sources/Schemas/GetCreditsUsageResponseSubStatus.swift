import Foundation

/// Status of the subscription credits. Null if the account has no subscription.
public enum GetCreditsUsageResponseSubStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case overdue
    case cancelled
    case deactivated
}