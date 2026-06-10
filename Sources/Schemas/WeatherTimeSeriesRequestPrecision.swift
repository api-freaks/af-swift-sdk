import Foundation

public enum WeatherTimeSeriesRequestPrecision: String, Codable, Hashable, CaseIterable, Sendable {
    case daily
    case hourly
}