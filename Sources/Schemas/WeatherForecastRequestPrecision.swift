import Foundation

public enum WeatherForecastRequestPrecision: String, Codable, Hashable, CaseIterable, Sendable {
    case daily
    case hourly
    case minutely
}