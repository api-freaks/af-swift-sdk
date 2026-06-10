import Foundation

/// Supported distance units are m, km, mi, ft, yd, in.
public enum ZipcodeDistanceRequestUnit: String, Codable, Hashable, CaseIterable, Sendable {
    case m
    case km
    case mi
    case ft
    case yd
    case `in`
}