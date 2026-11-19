import Foundation

public enum BulkEmailValidateResponseEmailResponseItemValidEmail: String, Codable, Hashable, CaseIterable, Sendable {
    case valid
    case acceptAll = "accept_all"
    case invalid
    case invalidEmail = "INVALID_EMAIL"
    case unknown
    case risky
    case appServerBlocked = "app_server_blocked"
}