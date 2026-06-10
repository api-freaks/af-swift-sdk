import Foundation

public enum MarineWeatherRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}