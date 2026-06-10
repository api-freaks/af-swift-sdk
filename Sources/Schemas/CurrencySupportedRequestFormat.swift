import Foundation

public enum CurrencySupportedRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}