import Foundation

public enum BulkDomainWhoisLookupV2RequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}