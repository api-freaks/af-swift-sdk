import Foundation

public enum GetFlagsRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case png
    case webp
    case svg
}