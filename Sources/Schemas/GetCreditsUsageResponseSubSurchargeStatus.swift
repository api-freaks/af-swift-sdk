import Foundation

/// Status of the subscription surcharge (overage) credits. Null if the account has no subscription.
public enum GetCreditsUsageResponseSubSurchargeStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case none
    case paymentAdded = "payment_added"
    case paymentCleared = "payment_cleared"
}