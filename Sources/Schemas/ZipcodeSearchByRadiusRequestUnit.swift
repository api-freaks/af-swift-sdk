import Foundation

public enum ZipcodeSearchByRadiusRequestUnit: String, Codable, Hashable, CaseIterable, Sendable {
    case m
    case km
    case mi
    case ft
    case yd
    case `in`
}