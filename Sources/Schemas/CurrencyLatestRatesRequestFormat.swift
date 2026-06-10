import Foundation

public enum CurrencyLatestRatesRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}