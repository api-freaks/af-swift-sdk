import Foundation

public enum EmailValidateResponseValidEmail: String, Codable, Hashable, CaseIterable, Sendable {
    case valid
    case invalid
}