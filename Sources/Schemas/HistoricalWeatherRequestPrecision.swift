import Foundation

public enum HistoricalWeatherRequestPrecision: String, Codable, Hashable, CaseIterable, Sendable {
    case daily
    case hourly
}