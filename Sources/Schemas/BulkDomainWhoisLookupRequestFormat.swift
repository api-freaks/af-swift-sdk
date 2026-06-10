import Foundation

public enum BulkDomainWhoisLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}