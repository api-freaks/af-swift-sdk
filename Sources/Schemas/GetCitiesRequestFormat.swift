import Foundation

public enum GetCitiesRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}