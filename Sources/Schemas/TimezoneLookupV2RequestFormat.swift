import Foundation

public enum TimezoneLookupV2RequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}