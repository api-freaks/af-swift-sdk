import Foundation

/// Indicates that this response contains historical data.
public enum DomainWhoisHistoryResponseWhois: String, Codable, Hashable, CaseIterable, Sendable {
    case historical
}