import Foundation

public enum BulkEmailValidateRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}