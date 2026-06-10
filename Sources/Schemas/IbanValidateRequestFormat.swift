import Foundation

public enum IbanValidateRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}