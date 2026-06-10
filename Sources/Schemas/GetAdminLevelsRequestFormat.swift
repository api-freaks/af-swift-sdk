import Foundation

public enum GetAdminLevelsRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}