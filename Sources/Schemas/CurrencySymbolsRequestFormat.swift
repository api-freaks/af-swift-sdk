import Foundation

public enum CurrencySymbolsRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}