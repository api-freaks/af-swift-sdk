import Foundation

public enum ZipcodeLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}