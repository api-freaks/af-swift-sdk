import Foundation

public enum BulkIpSecurityLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}