import Foundation

public enum AstronomyLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}