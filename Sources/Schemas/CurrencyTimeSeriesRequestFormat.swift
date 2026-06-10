import Foundation

public enum CurrencyTimeSeriesRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}