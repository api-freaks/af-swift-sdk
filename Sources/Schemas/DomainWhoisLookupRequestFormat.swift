import Foundation

public enum DomainWhoisLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}