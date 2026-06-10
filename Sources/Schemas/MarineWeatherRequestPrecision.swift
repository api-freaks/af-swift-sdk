import Foundation

public enum MarineWeatherRequestPrecision: String, Codable, Hashable, CaseIterable, Sendable {
    case daily
    case hourly
    case minutely
}