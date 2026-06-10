import Foundation

public enum CurrentWeatherRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}