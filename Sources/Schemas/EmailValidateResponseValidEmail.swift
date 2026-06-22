import Foundation

public enum EmailValidateResponseValidEmail: String, Codable, Hashable, CaseIterable, Sendable {
    case valid = "valid"
    case invalid = "Invalid"
    case unknown = "Unknown"
    case risky = "Risky"
}