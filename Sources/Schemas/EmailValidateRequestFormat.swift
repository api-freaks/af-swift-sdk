import Foundation

public enum EmailValidateRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}