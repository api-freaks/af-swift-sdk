import Foundation

public enum SubdomainsLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}