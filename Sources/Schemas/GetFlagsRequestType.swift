import Foundation

public enum GetFlagsRequestType: String, Codable, Hashable, CaseIterable, Sendable {
    case country
    case organization
}