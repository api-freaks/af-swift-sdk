import Foundation

public enum CurrencyHistoricalRatesRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}