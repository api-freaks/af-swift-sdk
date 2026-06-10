import Foundation

public enum WeatherTimeSeriesRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}