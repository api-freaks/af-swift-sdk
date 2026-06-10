import Foundation

public enum BulkZipcodeLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}