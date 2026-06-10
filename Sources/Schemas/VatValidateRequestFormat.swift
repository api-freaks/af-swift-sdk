import Foundation

public enum VatValidateRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}