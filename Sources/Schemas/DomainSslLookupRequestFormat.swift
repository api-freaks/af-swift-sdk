import Foundation

public enum DomainSslLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}