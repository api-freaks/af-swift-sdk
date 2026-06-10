import Foundation

public enum ZipcodeDistanceRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}