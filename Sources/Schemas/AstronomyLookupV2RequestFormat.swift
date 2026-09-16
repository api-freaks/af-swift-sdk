import Foundation

public enum AstronomyLookupV2RequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}