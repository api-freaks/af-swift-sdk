import Foundation

public enum ZipcodeSearchByCityRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}