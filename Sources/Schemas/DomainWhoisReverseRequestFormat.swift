import Foundation

public enum DomainWhoisReverseRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}