import Foundation

public enum BulkGeolocationLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}