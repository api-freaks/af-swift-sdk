import Foundation

public enum GetCreditsUsageRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}