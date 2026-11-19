import Foundation

public enum DisposableEmailCheckV2RequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}