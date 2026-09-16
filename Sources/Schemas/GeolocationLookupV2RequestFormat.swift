import Foundation

public enum GeolocationLookupV2RequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}