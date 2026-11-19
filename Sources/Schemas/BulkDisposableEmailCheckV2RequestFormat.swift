import Foundation

public enum BulkDisposableEmailCheckV2RequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}