import Foundation

public enum TimezoneLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}