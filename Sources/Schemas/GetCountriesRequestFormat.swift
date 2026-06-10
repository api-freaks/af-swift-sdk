import Foundation

public enum GetCountriesRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}