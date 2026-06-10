import Foundation

public enum BulkCurrentWeatherRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}