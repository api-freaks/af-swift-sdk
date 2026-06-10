import Foundation

public enum FloodForecastRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}