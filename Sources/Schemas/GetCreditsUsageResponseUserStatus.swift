import Foundation

/// Status of the user account.
public enum GetCreditsUsageResponseUserStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case deleted
}