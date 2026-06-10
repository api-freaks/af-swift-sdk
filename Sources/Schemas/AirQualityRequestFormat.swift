import Foundation

public enum AirQualityRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}