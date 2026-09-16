import Foundation

public enum DomainWhoisLookupV2RequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}