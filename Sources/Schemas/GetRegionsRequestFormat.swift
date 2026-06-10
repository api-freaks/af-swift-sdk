import Foundation

public enum GetRegionsRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}