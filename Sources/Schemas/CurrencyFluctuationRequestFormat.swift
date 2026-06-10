import Foundation

public enum CurrencyFluctuationRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}