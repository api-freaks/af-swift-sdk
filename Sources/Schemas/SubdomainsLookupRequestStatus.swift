import Foundation

public enum SubdomainsLookupRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
}