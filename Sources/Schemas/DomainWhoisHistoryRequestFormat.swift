import Foundation

public enum DomainWhoisHistoryRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}