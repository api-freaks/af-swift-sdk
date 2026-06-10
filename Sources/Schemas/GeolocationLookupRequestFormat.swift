import Foundation

public enum GeolocationLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}