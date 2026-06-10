import Foundation

public enum DomainDnsLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}