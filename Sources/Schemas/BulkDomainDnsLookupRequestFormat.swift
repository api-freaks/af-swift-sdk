import Foundation

public enum BulkDomainDnsLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}