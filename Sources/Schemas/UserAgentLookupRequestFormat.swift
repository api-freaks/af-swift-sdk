import Foundation

public enum UserAgentLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}