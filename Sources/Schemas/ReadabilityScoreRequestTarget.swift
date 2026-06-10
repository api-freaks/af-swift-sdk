import Foundation

public enum ReadabilityScoreRequestTarget: String, Codable, Hashable, CaseIterable, Sendable {
    case general
    case professional
    case academic
    case technical
}