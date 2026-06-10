import Foundation

public enum GetCountryDetailsRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}