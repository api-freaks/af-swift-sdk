import Foundation

public enum DomainSslChainLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}