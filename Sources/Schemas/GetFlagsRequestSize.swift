import Foundation

public enum GetFlagsRequestSize: String, Codable, Hashable, CaseIterable, Sendable {
    case sixteenPx = "16px"
    case twentyFourPx = "24px"
    case thirtyTwoPx = "32px"
    case fortyEightPx = "48px"
    case sixtyFourPx = "64px"
}