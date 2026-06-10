import Foundation

public enum SwiftCodeFindRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}