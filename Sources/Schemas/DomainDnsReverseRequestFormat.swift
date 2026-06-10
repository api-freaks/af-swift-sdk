import Foundation

public enum DomainDnsReverseRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}