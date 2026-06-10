import Foundation

public enum WeatherForecastRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}