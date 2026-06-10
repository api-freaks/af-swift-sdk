import Foundation

public enum HistoricalWeatherRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}