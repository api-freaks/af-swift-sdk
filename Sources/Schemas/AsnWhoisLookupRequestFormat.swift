import Foundation

public enum AsnWhoisLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}