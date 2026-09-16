import Foundation

public enum BulkGeolocationLookupV2RequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}