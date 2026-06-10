import Foundation

public enum BulkUserAgentLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}