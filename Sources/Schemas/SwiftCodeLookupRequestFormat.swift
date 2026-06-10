import Foundation

public enum SwiftCodeLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}